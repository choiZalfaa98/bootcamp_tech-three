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

//============================================================================
// Function to handle navigation when clicking on <a> tags with onclick attribute
function navigateTo(contentId) {
  // Remove 'active' class from all content sections
  let allContent = document.querySelectorAll('.content');
  allContent.forEach(function(content) {
    content.classList.remove('active');
  });

  // Add 'active' class to the selected content section
  let selectedContent = document.getElementById(contentId);
  if (selectedContent) {
    selectedContent.classList.add('active');
  }
}
