function updateSelectedDetails(id, avatar, number, name, location) {
    document.getElementById("selected-id").textContent = id;
    document.getElementById("selected-avatar").innerHTML = "<img src='uploads/" + avatar + "' width='50' />";
    document.getElementById("selected-number").textContent = number + " - ";
    document.getElementById("selected-name").textContent = name;
    document.getElementById("selected-location").textContent = location;
}

$(document).ready(function() {
    for (var i = 1; i <= 10; i++) {
        (function(teamNum) {
            $(".team-item" + teamNum).click(function() {
                handleTeamItemClick(teamNum, this);
            });
        })(i);
    }
});

function handleTeamItemClick(teamNum, element) {
    var teamId = $(element).data("id");
    var avatar = $(element).data("avatar");
    var number = $(element).data("number");
    var name = $(element).data("name");
    var location = $(element).data("location");

    $("#selected-id" + teamNum).text(teamId);
    $("#selected-avatar" + teamNum).html(`<img src="../uploads/${avatar}" class="avatar-image" width="50"/>`);
    $("#selected-number" + teamNum).text(number);
    $("#selected-name" + teamNum).text(name);
    $("#selected-location" + teamNum).text(location);
}

function openModal(modalId) {
    var modal = document.getElementById(modalId);
    modal.style.display = "block";
}

function closeModal(modalId) {
    var modal = document.getElementById(modalId);
    modal.style.display = "none";
}

function saveTextAndCloseModal(savedTextId, textInputClass, modalId) {
    var savedText = document.getElementById(savedTextId);
    var textInput = document.querySelector("." + textInputClass);
    savedText.innerHTML = textInput.value;
    closeModal(modalId);
}

function addModalListeners(modalId, savedTextId, textInputClass, saveBtnClass) {
    var btn = document.querySelector("[data-modal-id='" + modalId + "']");
    var modal = document.getElementById(modalId);
    var saveBtn = document.querySelector("." + saveBtnClass);

    btn.onclick = function() {
        openModal(modalId);
    };

    modal.querySelector(".close").onclick = function() {
        closeModal(modalId);
    };

    saveBtn.onclick = function() {
        saveTextAndCloseModal(savedTextId, textInputClass, modalId);
    };
}

addModalListeners("modal1", "savedText1", "textInput1", "save-btn1");
addModalListeners("modal2", "savedText2", "textInput2", "save-btn2");
addModalListeners("modal3", "savedText3", "textInput3", "save-btn3");
addModalListeners("modal4", "savedText4", "textInput4", "save-btn4");
addModalListeners("modal5", "savedText5", "textInput5", "save-btn5");
addModalListeners("modal6", "savedText6", "textInput6", "save-btn6");
