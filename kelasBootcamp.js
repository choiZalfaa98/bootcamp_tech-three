// REDIRECTING
function redirectToPage(targetedPage) {
  window.location.href = targetedPage;
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
//===========================================================================
//UPDATE TOPIK MATERI
function editMateriJudul() {
  let newJudul = prompt("Perbarui topik materi: ");
  if (newJudul) {
      let materiJudul = document.querySelector('.editable_nama_materi h2');
      materiJudul.textContent = newJudul;
  }
}

// UPDATE YOUTUBE LINK
function editVideoLink() {
  var newLink = prompt("Masukkan link video Youtube baru untuk memperbarui:");
  if (newLink) {
      var videoId = extractVideoId(newLink);
      if (videoId) {
          var embedLink = `https://www.youtube.com/embed/${videoId}`;
          var videoFrame = document.getElementById('videoFrame');
          videoFrame.src = embedLink;
      } else {
          alert("Link video YouTube tidak valid. Pastikan itu adalah tautan video YouTube yang valid.");
      }
  }
}

function extractVideoId(url) {
  // Pola URL untuk https://youtu.be/VIDEO_ID
  var shortMatch = url.match(/youtu\.be\/([^&?/]+)/);
  if (shortMatch) {
      return shortMatch[1];
  }

  // Pola URL untuk https://www.youtube.com/watch?v=VIDEO_ID
  var longMatch = url.match(/[?&]v=([^&]+)/);
  if (longMatch) {
      return longMatch[1];
  }

  // Jika tautan tidak cocok dengan pola yang diberikan
  return null;
}
