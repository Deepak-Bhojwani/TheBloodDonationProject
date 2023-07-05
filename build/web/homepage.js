//Side Menu
const sideNav = document.querySelector('.sidenav');
M.Sidenav.init(sideNav, {});

//Slider
const slider = document.querySelector('.slider');
M.Slider.init(slider, {
    indicators: false,
    height: 592,
    transition: 500,
    interval: 6000
});

//Material Boxed
const mb = document.querySelectorAll('.materialboxed');
M.Materialbox.init(mb, {});

//Scroll Spy
const ss = document.querySelectorAll('.scrollspy');
M.ScrollSpy.init(ss, {});