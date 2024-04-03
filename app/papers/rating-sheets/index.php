<?php
const LOGIN_PAGE_PATH = '../../crud/';
require_once '../../crud/auth.php';

require_once '../../config/database.php';
require_once '../../models/Competition.php';
require_once '../../models/Event.php';
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
    <title>Rating Sheets</title>
</head>
<body>
<!-- RATING SHEET -->
<div class="container-fluid mt-5">
    <div class="row">
        <!-- events -->
        <?php
        foreach(Event::all() as $event) {
            if($event->getSlug() != '') {
                ?>
                <div class="pt-3 pb-5 mb-5" style="page-break-after: always">
                    <div class="row">
                        <div class="col-md-6 text-center">
                            <h4 class="text-uppercase"><?= Competition::findById(1)->getTitle() ?></h4>
                            <h3>R A T I N G&nbsp;&nbsp;&nbsp;&nbsp;S H E E T</h3>
                        </div>
                        <div class="col-md-6 text-center pt-3" align="center">
                            <div style="display: inline-block; width: 320px;">
                                <div style="border-bottom: 2px solid black" align="left">
                                    <small>JUDGE <b>#___</b></small> :
                                </div>
                                <h6 class="mt-1 pe-3" align="right">Signature over printed name</h6>
                            </div>
                        </div>
                    </div>

                    <hr class="mb-4"/>

                    <table class="table">
                        <thead>
                        <tr class="table-secondary">
                            <!-- event title -->
                            <th colspan="3" rowspan="2" class="text-center bl bt br">
                                <h2 class="text-center text-uppercase fw-bold m-0"><?= $event->getTitle() ?></h2>
                            </th>

                            <!-- criteria title headers -->
                            <?php foreach($event->getAllCriteria() as $criterion) { ?>
                                <th class="text-center br bt" style="width: 10%"><?= $criterion->getTitle() ?></th>
                            <?php } ?>

                            <!-- total header -->
                            <th class="table-success br" style="width: 11%">
                                <h4 class="text-center text-uppercase m-0">TOTAL</h4>
                            </th>

                            <!-- rank header -->
                            <th class="table-primary br" style="width: 11%">
                                <h4 class="text-center text-uppercase m-0">RANK</h4>
                            </th>
                        </tr>
                        <tr class="table-secondary">
                            <!-- criteria points headers -->
                            <?php foreach($event->getAllCriteria() as $criterion) { ?>
                                <th class="text-center br">
                                    <h5 class="m-0"><b><?= $criterion->getPercentage() ?></b>%</h5>
                                </th>
                            <?php } ?>

                            <!-- total spacer -->
                            <th class="table-success text-center bb br">
                                <?php $total_percent = $event->getTotalCriteriaPercentage(); ?>
                                <small>
                                    <?= number_format(($total_percent * 0.50), 2) ?>
                                    -
                                    <?= ($total_percent >= 100) ? number_format($total_percent, 0) : number_format($total_percent, 2) ?>
                                </small>
                            </th>

                            <!-- rank notes -->
                            <th class="table-primary text-center bb br"><small>1 = <i>highest</i></small></th>
                        </tr>
                        </thead>

                        <tbody>
                        <!-- event teams -->
                        <?php foreach($event->getAllTeams() as $team) { ?>
                            <tr>
                                <!-- team number -->
                                <td class="pe-3 fw-bold bl bb" align="right" style="width: 64px;">
                                    <h3 class="m-0">
                                        <?= $team->getNumber() ?>
                                    </h3>
                                </td>

                                <!-- team avatar -->
                                <td class="bb" style="width: 56px;">
                                    <img
                                        src="../../crud/uploads/<?= $team->getAvatar() ?>"
                                        alt="<?= $team->getNumber() ?>"
                                        style="width: 56px; border-radius: 100%"
                                    >
                                </td>

                                <!-- team name -->
                                <td class="br bb">
                                    <h5 class="text-uppercase m-0"><?= $team->getName() ?></h5>
                                    <small class="m-0"><?= $team->getLocation() ?></small>
                                </td>

                                <!-- rating box -->
                                <?php foreach($event->getAllCriteria() as $criterion) { ?>
                                    <td class="bb br"></td>
                                <?php } ?>

                                <!-- total box -->
                                <td class="table-success bb br"></td>

                                <!-- rank box -->
                                <td class="table-primary bb br"></td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>

                    <div class="row justify-content-center pt-5">
                        <div class="col-md-7">
                            <p class="py-2 m-0">
                                <b>NOTE: </b>
                                Please utilize this printed rating sheet for note-taking purposes only.
                                Kindly record the final ratings of candidates in the digital rating sheets we will supply.
                                If you require assistance or have any concerns, please call our attention or press the "ASK FOR HELP" button on your screen.
                                Thank you.
                            </p>
                        </div>

                        <div class="col-md-2">
                            <div class="h-100 d-flex justify-content-center align-items-center">
                                <img src="/miss-aclc-iriga/aclc-iriga.png" alt="ACLC College of Iriga (Official Tabulator)" style="width: 156px;"/>
                            </div>
                        </div>
                    </div>
                </div>
                <?php
            }
        }
        ?>
    </div>
</div>

<script src="../../crud/dist/bootstrap-5.2.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>