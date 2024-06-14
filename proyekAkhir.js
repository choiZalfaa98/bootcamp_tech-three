// REDIRECTING
function redirectToPage(targetedPage) {
  window.location.href = targetedPage;
  window.scroll(0, 0);
}

// UPDATE TOPIK MATERI
function editMateriJudul() {
  let newJudul = prompt("Perbarui judul proyek akhir: ");
  if (newJudul) {
    let materiJudul = document.querySelector('.editable_nama_materi h2');
    materiJudul.textContent = newJudul;
  }
}

//======================================================================================
function editSection(icon) {
  // Find the next sibling element which should be a <p> tag with class "paragraf"
  const paragraph = icon.closest('section').nextElementSibling;

  if (paragraph && paragraph.classList.contains('paragraf')) {
    const sectionContent = paragraph.innerHTML;

    // Create a textarea with the existing content
    const textarea = document.createElement('textarea');
    textarea.style.width = '100%';
    textarea.style.height = '200px';
    textarea.value = sectionContent;

    // Replace the section content with the textarea
    paragraph.innerHTML = '';
    paragraph.appendChild(textarea);

    // Create a save button
    const saveButton = document.createElement('button');
    saveButton.innerText = 'Simpan';
    saveButton.onclick = () => saveText(paragraph, textarea.value);
    paragraph.appendChild(saveButton);
  }
}

function saveText(paragraph, newText) {
  paragraph.innerHTML = newText;
}
//======================================
