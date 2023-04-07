<?php
    const LOGIN_PAGE_PATH = '../../crud/';
    require_once '../../crud/auth.php';

    require_once '../../config/database.php';
    require_once '../../models/Admin.php';
    require_once '../../models/Team.php';
    require_once '../../models/Event.php';

    // initialize titles
    $titles = ['1', '2', '3', '4', '5', '6', '7', '8'];

    // initialize admin
    $admin = new Admin();

    // initialize events
    $event_production   = Event::findBySlug('production');
    $event_swimwear     = Event::findBySlug('swimwear');
    $event_advocacy     = Event::findBySlug('advocacy');
    $event_evening_gown = Event::findBySlug('evening-gown');

    // tabulate events
    $result_production   = $admin->tabulate($event_production);
    $result_swimwear     = $admin->tabulate($event_swimwear);
    $result_advocacy     = $admin->tabulate($event_advocacy);
    $result_evening_gown = $admin->tabulate($event_evening_gown);

    // process result
    $result = [];
    $unique_total_ranks    = [];
    $unique_adjusted_ranks = [];
    foreach(Team::all() as $team) {
        $team_key = 'team_'.$team->getId();

        // get production rank and average
        $rank_production    = 0;
        $average_production = 0;
        if(isset($result_production['teams'][$team_key])) {
            $rank_production    = $result_production['teams'][$team_key]['rank']['final']['fractional'];
            $average_production = $result_production['teams'][$team_key]['ratings']['average'];
        }

        // get swimwear rank and average
        $rank_swimwear    = 0;
        $average_swimwear = 0;
        if(isset($result_swimwear['teams'][$team_key])) {
            $rank_swimwear    = $result_swimwear['teams'][$team_key]['rank']['final']['fractional'];
            $average_swimwear = $result_swimwear['teams'][$team_key]['ratings']['average'];
        }

        // get advocacy rank and average
        $rank_advocacy    = 0;
        $average_advocacy = 0;
        if(isset($result_advocacy['teams'][$team_key])) {
            $rank_advocacy    = $result_advocacy['teams'][$team_key]['rank']['final']['fractional'];
            $average_advocacy = $result_advocacy['teams'][$team_key]['ratings']['average'];
        }

        // get evening gown rank and average
        $rank_evening_gown    = 0;
        $average_evening_gown = 0;
        if(isset($result_evening_gown['teams'][$team_key])) {
            $rank_evening_gown    = $result_evening_gown['teams'][$team_key]['rank']['final']['fractional'];
            $average_evening_gown = $result_evening_gown['teams'][$team_key]['ratings']['average'];
        }

        // get total rank and average
        $total_rank    = $rank_production + $rank_swimwear + $rank_advocacy + $rank_evening_gown;
        $total_average = ($average_production + $average_swimwear + $average_advocacy + $average_evening_gown) / 4;

        // push $total_rank to $unique_total_ranks
        if(!in_array($total_rank, $unique_total_ranks))
            $unique_total_ranks[] = $total_rank;

        // append to $result
        $result[$team_key] = [
            'info'   => $team->toArray(),
            'inputs' => [
                'production' => [
                    'rank'    => $rank_production,
                    'average' => $average_production
                ],
                'swimwear' => [
                    'rank'    => $rank_swimwear,
                    'average' => $average_swimwear
                ],
                'advocacy' => [
                    'rank'    => $rank_advocacy,
                    'average' => $average_advocacy
                ],
                'evening_gown' => [
                    'rank'    => $rank_evening_gown,
                    'average' => $average_evening_gown
                ]
            ],
            'average' => $total_average,
            'rank' => [
                'total'    => $total_rank,
                'dense'    => 0,
                'initial'  => 0,
                'adjusted' => 0,
                'final' => [
                    'dense'      => 0,
                    'fractional' => 0
                ]
            ],
            'title' => ''
        ];
    }

    // sort $unique_total_ranks
    sort($unique_total_ranks);

    // gather $rank_group (for getting fractional rank)
    $rank_group = [];
    foreach($result as $team_key => $team) {
        // get dense rank
        $dense_rank = 1 + array_search($team['rank']['total'], $unique_total_ranks);
        $result[$team_key]['rank']['dense'] = $dense_rank;

        // push $team_key to $rank_group
        $key_rank = 'rank_' . $dense_rank;
        if(!isset($rank_group[$key_rank]))
            $rank_group[$key_rank] = [];
        $rank_group[$key_rank][] = $team_key;
    }

    // get initial fractional rank
    $ctr = 0;
    for($i = 0; $i < sizeof($unique_total_ranks); $i++) {
        $key = 'rank_' . ($i + 1);
        $group = $rank_group[$key];
        $size = sizeof($group);
        $initial_rank = $ctr + ((($size * ($size + 1)) / 2) / $size);

        // write $fractional_rank to $group members
        for($j = 0; $j < $size; $j++) {
            $result[$group[$j]]['rank']['initial'] = $initial_rank;

            // compute adjusted average
            $adjusted_rank = $initial_rank - ($result[$group[$j]]['average'] * 0.01);
            $result[$group[$j]]['rank']['adjusted'] = $adjusted_rank;

            // push to $unique_adjusted_ranks
            if(!in_array($adjusted_rank, $unique_adjusted_ranks))
                $unique_adjusted_ranks[] = $adjusted_rank;
        }

        $ctr += $size;
    }

    // sort $unique_adjusted_ranks
    sort($unique_adjusted_ranks);

    // gather $rank_group (for getting fractional rank)
    $rank_group = [];
    foreach($result as $team_key => $team) {
        // get dense rank
        $dense_rank = 1 + array_search($team['rank']['adjusted'], $unique_adjusted_ranks);
        $result[$team_key]['rank']['final']['dense'] = $dense_rank;

        // push $key to $rank_group
        $key_rank = 'rank_' . $dense_rank;
        if(!isset($rank_group[$key_rank]))
            $rank_group[$key_rank] = [];
        $rank_group[$key_rank][] = $team_key;
    }

    // get final fractional rank
    $unique_final_fractional_ranks = [];
    $ctr = 0;
    for($i = 0; $i < sizeof($unique_adjusted_ranks); $i++) {
        $key = 'rank_' . ($i + 1);
        $group = $rank_group[$key];
        $size = sizeof($group);
        $final_fractional_rank = $ctr + ((($size * ($size + 1)) / 2) / $size);

        // push to $unique_final_fractional_ranks
        if(!in_array($final_fractional_rank, $unique_final_fractional_ranks))
            $unique_final_fractional_ranks[] = $final_fractional_rank;

        // write $fractional_rank to $group members
        for($j = 0; $j < $size; $j++) {
            $result[$group[$j]]['rank']['final']['fractional'] = $final_fractional_rank;
        }

        $ctr += $size;
    }

    // sort $unique_final_fractional_ranks
    sort($unique_final_fractional_ranks);

    // determine tops
    $tops_ordered   = [];
    $tops_unordered = [];
    $i = 0;
    foreach($titles as $title) {
        // update title of $unique_final_fractional_ranks[$i]'th team
        foreach($result as $team_key => $team) {
            if($team['rank']['final']['fractional'] == $unique_final_fractional_ranks[$i]) {
                $result[$team_key]['title'] = $titles[$i];
                $tops_ordered[]   = $team['info']['id'];
                $tops_unordered[] = $team['info']['id'];
            }
        }

        $i += 1;
        if($i >= sizeof($unique_final_fractional_ranks))
            break;
    }

    // sort $tops_ordered
    sort($tops_ordered);

    // shuffle $tops_unordered (deterministic)
    mt_srand(615829437);
    shuffle($tops_unordered);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../../crud/dist/bootstrap-5.2.3/css/bootstrap.min.css">
    <style>
        th, td {
            vertical-align: middle;
        },
        .bt {
            border-top: 2px solid #aaa !important;
        }
        .br {
            border-right: 2px solid #aaa !important;
        }
        .bb, table.result tbody tr:last-child td {
            border-bottom: 2px solid #aaa !important;
        }
        .bl {
            border-left: 2px solid #aaa !important;
        }
    </style>
    <title>Top <?= sizeof($titles) ?></title>
</head>
<body>
    <table class="table table-bordered result">
        <thead>
            <tr class="table-secondary">
                <th colspan="3" rowspan="2" class="text-center bt br bl">
                    <h1 class="m-0">TOP <?= sizeof($titles) ?></h1>
                    <h5>BINIBINING SAN VICENTE 2023</h5>
                </th>
                <th colspan="2" class="text-center bt br">
                    PRODUCTION
                </th>
                <th colspan="2" class="text-center bt br">
                    SWIMWEAR
                </th>
                <th colspan="2" class="text-center bt br">
                    ADVOCACY
                </th>
                <th colspan="2" class="text-center bt br">
                    EVENING<br>GOWN
                </th>
                <th rowspan="2" class="text-center bl bt br">
                    <span class="opacity-75">GENERAL<br>AVERAGE</span>
                </th>
                <th rowspan="2" class="text-center bl bt br">
                    TOTAL<br>RANK
                </th>
                <th rowspan="2" class="text-center bl bt br">
                    INITIAL<br>RANK
                </th>
                <th rowspan="2" class="text-center bl bt br">
                    FINAL<br>RANK
                </th>
                <th rowspan="2" class="text-center bl bt br">
                    SLOT
                </th>
            </tr>
            <tr class="table-secondary">
                <th class="text-center bl"><span class="opacity-75">Ave.</span></th>
                <th class="text-center br">Rank</th>

                <th class="text-center bl"><span class="opacity-75">Ave.</span></th>
                <th class="text-center br">Rank</th>

                <th class="text-center bl"><span class="opacity-75">Ave.</span></th>
                <th class="text-center br">Rank</th>

                <th class="text-center bl"><span class="opacity-75">Ave.</span></th>
                <th class="text-center br">Rank</th>
            </tr>
        </thead>

        <tbody>
        <?php
        foreach($result as $team_key => $team) { ?>
            <tr<?= $team['title'] !== '' ? ' class="table-warning"' : '' ?>>
                <!-- number -->
                <td class="pe-2 fw-bold bl" align="right">
                    <h4 class="m-0">
                        <?= $team['info']['number'] ?>
                    </h4>
                </td>

                <!-- avatar -->
                <td style="width: 72px;">
                    <img
                        src="../../crud/uploads/<?= $team['info']['avatar'] ?>"
                        alt="<?= $team['info']['number'] ?>"
                        style="width: 100%; border-radius: 100%"
                    >
                </td>

                <!-- name -->
                <td class="br">
                    <h6 class="text-uppercase m-0"><?= $team['info']['name'] ?></h6>
                    <small class="m-0"><?= $team['info']['location'] ?></small>
                </td>

                <!-- production -->
                <td class="pe-2 bl" align="right">
                    <span class="opacity-75">
                        <?= number_format($team['inputs']['production']['average'], 2) ?>
                    </span>
                </td>
                <td class="pe-2 br" align="right">
                    <?= number_format($team['inputs']['production']['rank'], 2) ?>
                </td>

                <!-- swimwear -->
                <td class="pe-2 bl" align="right">
                    <span class="opacity-75">
                        <?= number_format($team['inputs']['swimwear']['average'], 2) ?>
                    </span>
                </td>
                <td class="pe-2 br" align="right">
                    <?= number_format($team['inputs']['swimwear']['rank'], 2) ?>
                </td>

                <!-- advocacy -->
                <td class="pe-2 bl" align="right">
                    <span class="opacity-75">
                        <?= number_format($team['inputs']['advocacy']['average'], 2) ?>
                    </span>
                </td>
                <td class="pe-2 br" align="right">
                    <?= number_format($team['inputs']['advocacy']['rank'], 2) ?>
                </td>

                <!-- evening_gown -->
                <td class="pe-2 bl" align="right">
                    <span class="opacity-75">
                        <?= number_format($team['inputs']['evening_gown']['average'], 2) ?>
                    </span>
                </td>
                <td class="pe-2 br" align="right">
                    <?= number_format($team['inputs']['evening_gown']['rank'], 2) ?>
                </td>

                <!-- general average -->
                <td class="pe-2 bl br fw-bold" align="right">
                    <span class="opacity-75">
                        <?= number_format($team['average'], 2) ?>
                    </span>
                </td>

                <!-- total rank -->
                <td class="pe-2 bl br fw-bold" align="right">
                    <?= number_format($team['rank']['total'], 2) ?>
                </td>

                <!-- initial rank -->
                <td class="pe-2 bl br fw-bold" align="right">
                    <?= number_format($team['rank']['initial'], 2) ?>
                </td>

                <!-- final rank -->
                <td class="pe-2 bl br fw-bold" align="right">
                    <?= number_format($team['rank']['final']['fractional'], 2) ?>
                </td>

                <!-- title -->
                <td class="pe-2 bl br fw-bold" align="center" style="line-height: 1.1">
                    <h4 class="ma-0"><?= $team['title'] ?></h4>
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>

    <!-- Judges -->
    <div class="container-fluid">
        <div class="row justify-content-center">
            <?php foreach($event_production->getAllJudges() as $judge) { ?>
                <div class="col-md-4">
                    <div class="mt-5 pt-3 text-center">
                        <h6 class="mb-0"><?= $judge->getName() ?></h6>
                    </div>
                    <div class="text-center">
                        <p class="mb-0">
                            Judge <?= $judge->getNumber() ?>
                            <?php if($judge->isChairmanOfEvent($event_production)) { ?>
                                * (Chairman)
                            <?php } ?>
                        </p>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>

    <!-- Summary -->
    <div class="container-fluid mt-5" style="page-break-before: always;">
        <div class="row">
            <!-- unordered -->
            <div class="col-md-6" align="center">
                <h1>TOP <?= sizeof($titles) ?> in Random Order</h1>
                <h4>FOR ANNOUNCEMENT</h4>
                <div style="width: 80%;">
                    <table class="table table-bordered mt-3">
                        <tbody>
                        <?php
                        foreach($tops_unordered as $team_id) {
                            $team = $result['team_'.$team_id];
                        ?>
                            <tr>
                                <!-- number -->
                                <td class="pe-2 fw-bold text-center">
                                    <h3 class="m-0">
                                        <?= $team['info']['number'] ?>
                                    </h3>
                                </td>

                                <!-- avatar -->
                                <td style="width: 72px;">
                                    <img
                                        src="../../crud/uploads/<?= $team['info']['avatar'] ?>"
                                        alt="<?= $team['info']['number'] ?>"
                                        style="width: 100%; border-radius: 100%"
                                    >
                                </td>

                                <!-- name -->
                                <td>
                                    <h6 class="text-uppercase m-0"><?= $team['info']['name'] ?></h6>
                                    <small class="m-0"><?= $team['info']['location'] ?></small>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- ordered -->
            <div class="col-md-6" align="center">
                <h1>TOP <?= sizeof($titles) ?> in Proper Order</h1>
                <h4>FOR FINAL Q & A</h4>
                <div style="width: 80%;">
                    <table class="table table-bordered mt-3">
                        <tbody>
                        <?php
                        foreach($tops_ordered as $team_id) {
                            $team = $result['team_'.$team_id];
                        ?>
                            <tr>
                                <!-- number -->
                                <td class="pe-2 fw-bold text-center">
                                    <h3 class="m-0">
                                        <?= $team['info']['number'] ?>
                                    </h3>
                                </td>

                                <!-- avatar -->
                                <td style="width: 72px;">
                                    <img
                                        src="../../crud/uploads/<?= $team['info']['avatar'] ?>"
                                        alt="<?= $team['info']['number'] ?>"
                                        style="width: 100%; border-radius: 100%"
                                    >
                                </td>

                                <!-- name -->
                                <td>
                                    <h6 class="text-uppercase m-0"><?= $team['info']['name'] ?></h6>
                                    <small class="m-0"><?= $team['info']['location'] ?></small>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="../../crud/dist/bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>