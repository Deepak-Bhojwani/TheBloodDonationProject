//Side menu
const sideNav = document.querySelectorAll('.sidenav');
M.Sidenav.init(sideNav, {});

//Date Picker
const Calender = document.querySelectorAll('.datepicker');
M.Datepicker.init(Calender, {
  format: 'dd-mm-yyyy'

});


document.addEventListener('DOMContentLoaded', function () {
  var elems = document.querySelectorAll('.modal');
  M.Modal.init(elems, {});
});



// Dropdown Menu
document.addEventListener('DOMContentLoaded', function () {
  var elms = document.querySelectorAll('select');
  M.FormSelect.init(elms);
})




//Menu bar
function home() {
  document.getElementById("home-section").style.display = "block";
  document.getElementById("manageblood-donor").style.display = "none";
  document.getElementById("updatecamp-location").style.display = "none";
  document.getElementById("eligible-section").style.display = "none";
  document.getElementById("eligible-section").style.display = "none";

  document.getElementById("manager-section").style.display = "none";
}

function eligible() {
  document.getElementById("home-section").style.display = "none";
  document.getElementById("manageblood-donor").style.display = "none";
  document.getElementById("updatecamp-location").style.display = "none";
  document.getElementById("eligible-section").style.display = "block";
  document.getElementById("report-section").style.display = "none";

  document.getElementById("manager-section").style.display = "none";
}

function report() {
  document.getElementById("home-section").style.display = "none";
  document.getElementById("manageblood-donor").style.display = "none";
  document.getElementById("updatecamp-location").style.display = "none";
  document.getElementById("eligible-section").style.display = "none";
  document.getElementById("report-section").style.display = "block";

  document.getElementById("manager-section").style.display = "none";
}

function manager() {
  document.getElementById("home-section").style.display = "none";
  document.getElementById("manageblood-donor").style.display = "none";
  document.getElementById("updatecamp-location").style.display = "none";
  document.getElementById("eligible-section").style.display = "none";
  document.getElementById("report-section").style.display = "none";
  document.getElementById("manager-section").style.display = "block";
}

function blood() {
  document.getElementById("home-section").style.display = "none";
  document.getElementById("manageblood-donor").style.display = "block";
  document.getElementById("updatecamp-location").style.display = "none";
  document.getElementById("eligible-section").style.display = "none";
  document.getElementById("report-section").style.display = "none";

  document.getElementById("manager-section").style.display = "none";
}

function camplocation() {
  document.getElementById("home-section").style.display = "none";
  document.getElementById("manageblood-donor").style.display = "none";
  document.getElementById("updatecamp-location").style.display = "block";
  document.getElementById("eligible-section").style.display = "none";
  document.getElementById("report-section").style.display = "none";
  document.getElementById("manager-section").style.display = "none";
}



