const changeTabWhenClicked = () => {
  const tab = document.querySelector('.tabs-underlined');
  if (tab) {
    window.addEventListener('click', () => {
      if (window.scrollY >= window.innerHeight) {
        tab.classList.add('active');
      } else {
        tab.classList.remove('active');
      }
    });
  }
}

export { changeTabWhenClicked };
