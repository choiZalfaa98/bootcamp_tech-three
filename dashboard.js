let subMenu = document.getElementById('subMenu');

function toggleMenu() {
  subMenu.classList.toggle('open-menu');
}

document.addEventListener("DOMContentLoaded", function() {
  const logoutLink = document.getElementById("logOut");

  // Handle logout
  logoutLink.addEventListener("click", function(event) {
    event.preventDefault();
    alert("Logging out...");
    // Redirect to landing page
    window.location.href = "index.html";
  });
});