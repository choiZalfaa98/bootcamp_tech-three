// REDIRECTING
function redirectToPage(targetedPage) {
  window.location.href = targetedPage;
  window.scroll(0, 0);
}

// Kembali ke Materi Button
function redirectToPage2() {
  window.location.href = 'materi.html';
  window.scroll(0, 0);
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

// UPDATE TOPIK MATERI
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

// HALAMAN QUIZ ADMIN EDIT
document.addEventListener('DOMContentLoaded', () => {
  let questionCount = document.querySelectorAll('.editable_soal_quiz').length;

  // Function to enter edit mode for a question
  window.editQuestion = (icon) => {
    const questionDiv = icon.closest('.editable_soal_quiz');
    const questionText = questionDiv.querySelector('h3');
    const questionTextarea = document.createElement('textarea');
    questionTextarea.className = 'questionTextarea';
    questionTextarea.value = questionText.textContent.slice(questionText.textContent.indexOf('.') + 2);
    questionText.replaceWith(questionTextarea);

    const allInputs = questionDiv.querySelectorAll('.kalimatJawaban');
    allInputs.forEach((input) => {
      const answerTextarea = document.createElement('textarea');
      answerTextarea.className = 'answerTextarea';
      answerTextarea.value = input.textContent;
      input.replaceWith(answerTextarea);
    });

    // Change edit icon to save icon
    icon.classList.remove('fa-pen-to-square');
    icon.classList.add('fa-save');
    icon.setAttribute('onclick', 'saveQuestion(this)');

    // Make the text area width 100%
    questionTextarea.style.width = '100%';
  };

  // Function to save the edited question
  window.saveQuestion = (icon) => {
    const questionDiv = icon.closest('.editable_soal_quiz');
    const questionTextarea = questionDiv.querySelector('.questionTextarea');
    const newQuestion = questionTextarea.value;
    const questionNumber = Array.from(document.querySelectorAll('.editable_soal_quiz')).indexOf(questionDiv) + 1;
    questionTextarea.outerHTML = `<h3>${questionNumber}. ${newQuestion}</h3>`;

    const allTextareas = questionDiv.querySelectorAll('.answerTextarea');
    allTextareas.forEach((textarea, index) => {
      const newText = textarea.value;
      const span = document.createElement('span');
      span.className = 'kalimatJawaban';
      span.textContent = newText;
      textarea.replaceWith(span);
    });

    // Change save icon back to edit icon
    icon.classList.remove('fa-save');
    icon.classList.add('fa-pen-to-square');
    icon.setAttribute('onclick', 'editQuestion(this)');

    alert('Quiz sudah diperbarui.');
  };

  // Function to delete a question
  window.deleteQuestion = (icon) => {
    const questionDiv = icon.closest('.editable_soal_quiz');
    questionDiv.remove();
    updateQuestionNumbers();
  };

  // Function to add a new question
  window.addQuestion = () => {
    questionCount++;
    const quizContainer = document.getElementById('quizContainer');
    const newQuestionHTML = `
      <div class="editable_soal_quiz">
        <form class="class-form" action="GET">
          <h3>${questionCount}. Pertanyaan Baru</h3>
          <div class="quizAnswers">
            <label>
              <input type="radio" name="answer${questionCount}" value="A" class="opsi">
              <span class="opsi">A</span><span class="kalimatJawaban">Opsi A</span>
            </label>
            <label>
              <input type="radio" name="answer${questionCount}" value="B" class="opsi">
              <span class="opsi">B</span><span class="kalimatJawaban">Opsi B</span>
            </label>
            <label>
              <input type="radio" name="answer${questionCount}" value="C" class="opsi">
              <span class="opsi">C</span><span class="kalimatJawaban">Opsi C</span>
            </label>
            <label>
              <input type="radio" name="answer${questionCount}" value="D" class="opsi">
              <span class="opsi">D</span><span class="kalimatJawaban">Opsi D</span>
            </label>
          </div>
        </form>
        <div class="tools_edit">
          <i class="fa-solid fa-pen-to-square" onclick="editQuestion(this)"></i>
          <i class="fa-solid fa-trash-can" onclick="deleteQuestion(this)"></i>
        </div>
      </div>`;
    quizContainer.insertAdjacentHTML('beforeend', newQuestionHTML);
    updateQuestionNumbers(); // Update question numbers to reflect the new total
  };

  // Function to delete all questions
  window.deleteAllQuestions = () => {
    const quizContainer = document.getElementById('quizContainer');
    quizContainer.innerHTML = '';
    questionCount = 0; // Reset the question count
  };

  // Function to update question numbers
  const updateQuestionNumbers = () => {
    const questions = document.querySelectorAll('.editable_soal_quiz h3');
    questions.forEach((question, index) => {
      question.textContent = `${index + 1}. ${question.textContent.slice(question.textContent.indexOf('.') + 2)}`;
    });
  };
});
