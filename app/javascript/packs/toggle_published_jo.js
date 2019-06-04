const toggleIcon = document.querySelector(".published_toggle");
const class1 = 'fa-toggle-on';
const class2 = 'fa-toggle-off';

// toggle class on an element by providing the two classes to toggle
const toggleClass = (element, class1, class2) => {
  element.addEventListener('click', (event) => {
    if (event.currentTarget.classList.value.includes(class1)) {
      event.currentTarget.classList.remove(class1);
      event.currentTarget.classList.add(class2);
    } else {
      event.currentTarget.classList.remove(class2);
      event.currentTarget.classList.add(class1);
    }
  })
}

toggleClass(toggleIcon, class1, class2);
