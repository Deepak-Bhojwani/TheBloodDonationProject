//Side menu
const sideNav = document.querySelectorAll('.sidenav');
M.Sidenav.init(sideNav, {});

//Date Picker
const Calender = document.querySelectorAll('.datepicker');
M.Datepicker.init(Calender, {
    format: 'dd-mm-yyyy'

});

// Dropdown Menu
document.addEventListener('DOMContentLoaded', function () {
    var elms = document.querySelectorAll('select');
    M.FormSelect.init(elms);
})


//Menu bar
function home() {
    document.getElementById("home").style.display = "block";
    document.getElementById("updatebloodgroup-section").style.display = "none";
    document.getElementById("updatestatus-section").style.display = "none";
    document.getElementById("adddonor-section").style.display = "none";
    document.getElementById("addbloodpackage-section").style.display = "none";

}

function updatebloodgroup() {
    document.getElementById("home").style.display = "none";
    document.getElementById("updatebloodgroup-section").style.display = "block";
    document.getElementById("updatestatus-section").style.display = "none";
    document.getElementById("adddonor-section").style.display = "none";
    document.getElementById("addbloodpackage-section").style.display = "none";

}

function adddonor() {
    document.getElementById("home").style.display = "none";
    document.getElementById("updatebloodgroup-section").style.display = "none";
    document.getElementById("updatestatus-section").style.display = "none";
    document.getElementById("adddonor-section").style.display = "block";
    document.getElementById("addbloodpackage-section").style.display = "none";
}

function addpackage() {
    document.getElementById("home").style.display = "none";
    document.getElementById("updatebloodgroup-section").style.display = "none";
    document.getElementById("updatestatus-section").style.display = "none";
    document.getElementById("adddonor-section").style.display = "none";
    document.getElementById("addbloodpackage-section").style.display = "block";

}

function updatestatus() {
    document.getElementById("home").style.display = "none";
    document.getElementById("updatebloodgroup-section").style.display = "none";
    document.getElementById("updatestatus-section").style.display = "block";
    document.getElementById("adddonor-section").style.display = "none";
    document.getElementById("addbloodpackage-section").style.display = "none";

}


