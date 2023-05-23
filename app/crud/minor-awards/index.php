<?php
    // File paths
    const LOGIN_PAGE_PATH = '../../crud/';

    // Required files
    require_once '../../crud/auth.php';
    require_once '../../config/database.php';
    require_once '../../models/Team.php';
    require_once '../../models/Judge.php';
    require_once '../../models/User.php';

    // Fetch all teams and judges
    $teams = Team::all();
    $judges = Judge::all();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>minor-awards</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../dist/bootstrap-5.2.3/css/bootstrap.min.css">

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="../dist/fontawesome-6.3.0/css/all.min.css">

    <!-- Bootstrap v3 CSS -->
    <link rel="stylesheet" href="../dist/bootstrap-3.4.1/css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container py-5">
        <h2 class="fw-bolder">Binibining San Vicente (Buhi, Camarines Sur) 2023</h2>
    </div>
    <div>
        <table>
            <thead>
            <th>
                <button class="openModalBtn btn btn-outline-primary" data-modal-id="modal1" style="float: right;">Add</button>
                <span id="savedText1" class="fw-bolder" style="display: block; text-align: center;"></span>
                <!-- The modal -->
                <div id="modal1" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <span class="close" style="text-align: right;">&times;</span>
                        <textarea class="textInput1" style="text-align: center;" rows="4" cols="50"></textarea>
                        <div class="dropdown">
                            <button class="btn btn-primary dropdown-toggle my-3" type="button" data-toggle="dropdown">Select Candidate</button>
                            <div class="dropdown-menu">
                                <?php foreach ($teams as $team) { ?>
                                    <a class="dropdown-item team-item1" href="#" data-id="<?php echo $team->getId(); ?>"
                                       data-avatar="<?php echo $team->getAvatar(); ?>"
                                       data-number="<?php echo $team->getNumber(); ?>"
                                       data-name="<?php echo $team->getName(); ?>"
                                       data-location="<?php echo $team->getLocation(); ?>"
                                       onclick="updateSelectedDetails('<?php echo $team->getId(); ?>', '<?php echo $team->getAvatar(); ?>', '<?php echo $team->getNumber(); ?>', '<?php echo $team->getName(); ?>', '<?php echo $team->getLocation(); ?>')">
                                        <img src="uploads/<?php echo $team->getAvatar(); ?>" width="50" />
                                        <?php echo $team->getNumber(); ?> - <?php echo $team->getName(); ?> - <?php echo $team->getLocation(); ?>
                                    </a>
                                <?php } ?>
                            </div>
                            <button class="save-btn1 btn btn-outline-primary my-3" style="float: right;">Save</button>
                        </div>
                    </div>
                </div>
            </th>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div class="d-flex justify-content-center align-items-center" id="selected-details1">
                            <span id="selected-id1" class="d-none"></span>
                            <h1 id="selected-number1" class="align-middle fw-bolder display-3 me-4"></h1>
                            <div>
                                <div class="d-flex">
                                    <div class="d-flex align-items-center">
                                        <span id="selected-avatar1"></span>
                                    </div>
                                    <div class="ms-3 text-start align-middle mt-4">
                                        <p id="selected-name1" class="m-0 card-header fw-bold" style="line-height: 0.5"></p>
                                        <small id="selected-location1" class="m-0" style="font-size: 12px"></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <br>
    <div>
        <table>
            <thead>
                <th>
                    <button class="openModalBtn btn btn-outline-primary" data-modal-id="modal2" style="float: right;">Add</button>
                    <span id="savedText2" class="fw-bolder"  style="display: block; text-align: center;"></span>
                    <!-- The modal -->
                    <div id="modal2" class="modal">
                        <!-- Modal content -->
                        <div class="modal-content">
                            <span class="close" style="text-align: right;">&times;</span>
                            <textarea class="textInput2" style="text-align: center;" rows="4" cols="50"></textarea>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle my-3" type="button" data-toggle="dropdown">Select Candidate</button>
                                <div class="dropdown-menu">
                                    <?php foreach ($teams as $team) { ?>
                                        <a class="dropdown-item team-item2" href="#" data-id="<?php echo $team->getId(); ?>"
                                           data-avatar="<?php echo $team->getAvatar(); ?>"
                                           data-number="<?php echo $team->getNumber(); ?>"
                                           data-name="<?php echo $team->getName(); ?>"
                                           data-location="<?php echo $team->getLocation(); ?>"
                                           onclick="updateSelectedDetails('<?php echo $team->getId(); ?>', '<?php echo $team->getAvatar(); ?>', '<?php echo $team->getNumber(); ?>', '<?php echo $team->getName(); ?>', '<?php echo $team->getLocation(); ?>')">
                                            <img src="uploads/<?php echo $team->getAvatar(); ?>" width="50" />
                                            <?php echo $team->getNumber(); ?> - <?php echo $team->getName(); ?> - <?php echo $team->getLocation(); ?>
                                        </a>
                                    <?php } ?>
                                </div>
                                <button class="save-btn2 btn btn-outline-primary my-3"  style="float: right;">Save</button>
                            </div>
                        </div>
                    </div>
                </th>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div class="d-flex justify-content-center align-items-center" id="selected-details2">
                            <span id="selected-id2" class="d-none"></span>
                            <h1 id="selected-number2" class="align-middle fw-bolder display-3 me-4"></h1>
                            <div>
                                <div class="d-flex">
                                    <div class="d-flex align-items-center">
                                        <span id="selected-avatar2"></span>
                                    </div>
                                    <div class="ms-3 text-start align-middle mt-4">
                                        <p id="selected-name2" class="m-0 card-header fw-bold" style="line-height: 0.5;"></p>
                                        <small id="selected-location2" class="m-0" style="font-size: 12px"></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <br>
    <div>
        <table>
            <thead>
                <th>
                    <button class="openModalBtn btn btn-outline-primary" data-modal-id="modal3" style="float: right;">Add</button>
                    <span id="savedText3" class="fw-bolder" style="display: block; text-align: center;"></span>
                    <!-- The modal -->
                    <div id="modal3" class="modal">
                        <!-- Modal content -->
                        <div class="modal-content">
                            <span class="close" style="text-align: right;">&times;</span>
                            <textarea class="textInput3" style="text-align: center;" rows="4" cols="50"></textarea>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle my-3" type="button" data-toggle="dropdown">Select Candidate</button>
                                <div class="dropdown-menu">
                                    <?php foreach ($teams as $team) { ?>
                                        <a class="dropdown-item team-item3" href="#" data-id="<?php echo $team->getId(); ?>"
                                           data-avatar="<?php echo $team->getAvatar(); ?>"
                                           data-number="<?php echo $team->getNumber(); ?>"
                                           data-name="<?php echo $team->getName(); ?>"
                                           data-location="<?php echo $team->getLocation(); ?>"
                                           onclick="updateSelectedDetails('<?php echo $team->getId(); ?>', '<?php echo $team->getAvatar(); ?>', '<?php echo $team->getNumber(); ?>', '<?php echo $team->getName(); ?>', '<?php echo $team->getLocation(); ?>')">
                                            <img src="uploads/<?php echo $team->getAvatar(); ?>" width="50" />
                                            <?php echo $team->getNumber(); ?> - <?php echo $team->getName(); ?> - <?php echo $team->getLocation(); ?>
                                        </a>
                                    <?php } ?>
                                </div>
                                <button class="save-btn3 btn btn-outline-primary my-3" style="float: right;">Save</button>
                            </div>
                        </div>
                    </div>
                </th>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div class="d-flex justify-content-center align-items-center" id="selected-details3">
                            <span id="selected-id3" class="d-none"></span>
                            <h1 id="selected-number3" class="align-middle fw-bolder display-3 me-4"></h1>
                            <div>
                                <div class="d-flex">
                                    <div class="d-flex align-items-center">
                                        <span id="selected-avatar3"></span>
                                    </div>
                                    <div class="ms-3 text-start align-middle mt-4">
                                        <p id="selected-name3" class="m-0 card-header fw-bold" style="line-height: 0.5;"></p>
                                        <small id="selected-location3" class="m-0" style="font-size: 12px"></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <br>
    <div>
        <table>
            <thead>
                <th>
                    <button class="openModalBtn btn btn-outline-primary" data-modal-id="modal4" style="float: right;">Add</button>
                    <span id="savedText4" class="fw-bolder" style="display: block; text-align: center;"></span>
                    <!-- The modal -->
                    <div id="modal4" class="modal">
                        <!-- Modal content -->
                        <div class="modal-content">
                            <span class="close" style="text-align: right;">&times;</span>
                            <textarea class="textInput4" style="text-align: center;" rows="4" cols="50"></textarea>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle my-3" type="button" data-toggle="dropdown">Select Candidate</button>
                                <div class="dropdown-menu">
                                    <?php foreach ($teams as $team) { ?>
                                        <a class="dropdown-item team-item4" href="#" data-id="<?php echo $team->getId(); ?>"
                                           data-avatar="<?php echo $team->getAvatar(); ?>"
                                           data-number="<?php echo $team->getNumber(); ?>"
                                           data-name="<?php echo $team->getName(); ?>"
                                           data-location="<?php echo $team->getLocation(); ?>"
                                           onclick="updateSelectedDetails('<?php echo $team->getId(); ?>', '<?php echo $team->getAvatar(); ?>', '<?php echo $team->getNumber(); ?>', '<?php echo $team->getName(); ?>', '<?php echo $team->getLocation(); ?>')">
                                            <img src="uploads/<?php echo $team->getAvatar(); ?>" width="50" />
                                            <?php echo $team->getNumber(); ?> - <?php echo $team->getName(); ?> - <?php echo $team->getLocation(); ?>
                                        </a>
                                    <?php } ?>
                                </div>
                                <button class="save-btn4 btn btn-outline-primary my-3" style="float: right;">Save</button>
                            </div>
                        </div>
                    </div>
                </th>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div class="d-flex justify-content-center align-items-center" id="selected-details4">
                            <span id="selected-id4" class="d-none"></span>
                            <h1 id="selected-number4" class="align-middle fw-bolder display-3 me-4"></h1>
                            <div>
                                <div class="d-flex">
                                    <div class="d-flex align-items-center">
                                        <span id="selected-avatar4"></span>
                                    </div>
                                    <div class="ms-3 text-start align-middle mt-4">
                                        <p id="selected-name4" class="m-0 card-header fw-bold" style="line-height: 0.5;"></p>
                                        <small id="selected-location4" class="m-0" style="font-size: 12px"></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <br>
    <div>
        <table>
            <thead>
                <th>
                    <button class="openModalBtn btn btn-outline-primary" data-modal-id="modal5" style="float: right;">Add</button>
                    <span id="savedText5" class="fw-bolder" style="display: block; text-align: center;"></span>
                    <!-- The modal -->
                    <div id="modal5" class="modal">
                        <!-- Modal content -->
                        <div class="modal-content">
                            <span class="close" style="text-align: right;">&times;</span>
                            <textarea class="textInput5" style="text-align: center;" rows="4" cols="50"></textarea>
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle my-3" type="button" data-toggle="dropdown">Select Candidate</button>
                                <div class="dropdown-menu">
                                    <?php foreach ($teams as $team) { ?>
                                        <a class="dropdown-item team-item5" href="#" data-id="<?php echo $team->getId(); ?>"
                                           data-avatar="<?php echo $team->getAvatar(); ?>"
                                           data-number="<?php echo $team->getNumber(); ?>"
                                           data-name="<?php echo $team->getName(); ?>"
                                           data-location="<?php echo $team->getLocation(); ?>"
                                           onclick="updateSelectedDetails('<?php echo $team->getId(); ?>', '<?php echo $team->getAvatar(); ?>', '<?php echo $team->getNumber(); ?>', '<?php echo $team->getName(); ?>', '<?php echo $team->getLocation(); ?>')">
                                            <img src="uploads/<?php echo $team->getAvatar(); ?>" width="50" />
                                            <?php echo $team->getNumber(); ?> - <?php echo $team->getName(); ?> - <?php echo $team->getLocation(); ?>
                                        </a>
                                    <?php } ?>
                                </div>
                                <button class="save-btn5 btn btn-outline-primary my-3" style="float: right;">Save</button>
                            </div>
                        </div>
                    </div>
                </th>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div class="d-flex justify-content-center align-items-center" id="selected-details5">
                            <span id="selected-id5" class="d-none"></span>
                            <h1 id="selected-number5" class="align-middle fw-bolder display-3 me-4"></h1>
                            <div>
                                <div class="d-flex">
                                    <div class="d-flex align-items-center">
                                        <span id="selected-avatar5"></span>
                                    </div>
                                    <div class="ms-3 text-start align-middle mt-4">
                                        <p id="selected-name5" class="m-0 card-header fw-bold" style="line-height: 0.5;"></p>
                                        <small id="selected-location5" class="m-0" style="font-size: 12px"></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <br>

    <script src="../dist/jquery-3.6.4/jquery-3.6.4.min.js"></script>
    <script src="../dist/bootstrap-3.4.1/js/bootstrap.min.js"></script>
    <script src="main.js"></script>
</body>
</html>
