document.addEventListener("DOMContentLoaded", function() {
  const userIcon = document.querySelector(".user-icon");
  const dropdownMenu = document.getElementById("dropdown-menu");

  userIcon.addEventListener("click", function(event) {
    dropdownMenu.classList.toggle("show");
  });

  // Close the dropdown if the user clicks outside of it
  window.addEventListener("click", function(event) {
    if (!event.target.matches('.user-icon') && !event.target.closest('.user-icon')) {
      if (dropdownMenu.classList.contains('show')) {
        dropdownMenu.classList.remove('show');
      }
    }
  });
});
