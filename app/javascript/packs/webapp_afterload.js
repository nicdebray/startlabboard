const navBurger = document.getElementById('navbar-burger');
const navClose = document.getElementById('navbar-close');
const navDd = document.getElementById('navbar-ddmenu');

const toggleHidden = (element) => {
  element.classList.toggle('hidden');
}

const toggleEvent = (target, tohide) => {
  target.addEventListener('click', event => {
    toggleHidden(tohide);
  })
}

toggleEvent(navBurger, navDd);
toggleEvent(navClose, navDd);
