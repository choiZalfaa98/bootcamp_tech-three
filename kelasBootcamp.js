// Mulai Quiz Button
function redirectToPage() {
  window.location.href = 'quiz.html';
  window.scroll(0,0);
}

// Kembali ke Materi Button
function redirectToPage2() {
  window.location.href = 'materi.html';
  window.scroll(0,0);
}

// Melihat Hasil Skor
function seeScore(targetedID, attributeName, attributeValue) {
  // Get the target element
  const targetElement = document.querySelector(targetedID);
  
  // Check if the target element exists
  if (targetElement) {
    // Set the specified attribute and value
    targetElement.setAttribute(attributeName, attributeValue);
    
    // Scroll to the target element
    targetElement.scrollIntoView({ behavior: 'smooth' });
  }
}