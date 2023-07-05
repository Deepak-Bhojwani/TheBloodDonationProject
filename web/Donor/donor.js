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
    document.getElementById("donorHomesection").style.display = "block";
    document.getElementById("camplocation-section").style.display = "none";
    document.getElementById("updateinfo-section").style.display = "none";
    document.getElementById("updatestatus-section").style.display = "none";

}

function profile() {
    document.getElementById("donorHomesection").style.display = "none";
    document.getElementById("camplocation-section").style.display = "none";
    document.getElementById("updateinfo-section").style.display = "none";
    document.getElementById("updatestatus-section").style.display = "none";
}



function updateprofile() {
    document.getElementById("donorHomesection").style.display = "none";
    document.getElementById("camplocation-section").style.display = "none";
    document.getElementById("updateinfo-section").style.display = "block";
    document.getElementById("updatestatus-section").style.display = "none";

}

function updatestatus() {
    document.getElementById("donorHomesection").style.display = "none";
    document.getElementById("camplocation-section").style.display = "none";
    document.getElementById("updateinfo-section").style.display = "none";
    document.getElementById("updatestatus-section").style.display = "block";

}

