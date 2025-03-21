let questions = [];
let currentQuestionIndex = 0;
let userResponses = {};
let reviewQuestions = {};
let timer;
let timeLeft = 60; // 60 seconds for each question

document.addEventListener("DOMContentLoaded", function () {
    fetchQuestions();
});

function fetchQuestions() {
    fetch("http://localhost:8080/quiz/questions") // Update URL if needed
        .then(response => response.json())
        .then(data => {
             questions = shuffleArray(data).slice(0, 5); // Shuffle and select 50 questions
            showQuestion();
        })
        .catch(error => console.error("Error fetching questions:", error));
}

// Function to shuffle questions (Fisher-Yates Algorithm)
function shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
        let j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]]; // Swap elements
    }
    return array;
}

function showQuestion() {
    if (questions.length === 0) {
        document.getElementById("question").innerText = "No questions available.";
        return;
    }

    let questionData = questions[currentQuestionIndex];
    document.getElementById("question").innerText = `${currentQuestionIndex + 1}. ${questionData.question}`;

    const optionsContainer = document.getElementById("options");
    optionsContainer.innerHTML = "";

    let inputType = questionData.multipleChoice ? "checkbox" : "radio";  
    let inputName = `question_${questionData.id}`;

    ["option1", "option2", "option3", "option4"].forEach(optionKey => {
        if (questionData[optionKey]) { // Ensure option exists
            let optionDiv = document.createElement("div");
            optionDiv.classList.add("form-check", "p-1");

            // Label to contain input & text (for better clickability)
            let optionLabel = document.createElement("label");
            optionLabel.classList.add("form-check-label", "d-flex", "align-items-center");
            optionLabel.style.cursor = "pointer";
            optionLabel.style.gap = "8px"; // Space between checkbox/radio and text

            let input = document.createElement("input");
            input.type = inputType;
            input.name = inputType === "radio" ? inputName : `${inputName}[]`;
            input.value = questionData[optionKey];
            input.id = `${inputName}_${optionKey}`;
            input.classList.add("form-check-input");

            // ✅ Fixed size for radio & checkboxes
            input.style.width = "1.2rem";  
            input.style.height = "1.2rem";  

            // Restore previous selection
            if (questionData.multipleChoice && Array.isArray(userResponses[questionData.id])) {
                input.checked = userResponses[questionData.id].includes(questionData[optionKey]);
            } else if (userResponses[questionData.id] === questionData[optionKey]) {
                input.checked = true;
            }

            // Append input & text inside label
            optionLabel.appendChild(input);
            optionLabel.appendChild(document.createTextNode(` ${questionData[optionKey]}`));

            // Hover effect only on text (no box)
            optionLabel.addEventListener("mouseenter", () => {
                optionLabel.style.color = "#007bff"; // Blue text on hover
            });
            optionLabel.addEventListener("mouseleave", () => {
                optionLabel.style.color = ""; // Reset to default
            });

            optionDiv.appendChild(optionLabel);
            optionsContainer.appendChild(optionDiv);
        }
    });

    let reviewCheckbox = document.getElementById("markReview");
    if (reviewCheckbox) {
        reviewCheckbox.checked = reviewQuestions[questionData.id] || false;
    }
	
	resetTimer();
}

// Function to reset & start timer
function resetTimer() {
    clearInterval(timer); // Clear previous timer
    timeLeft = 60; // Reset time to 60 seconds
    updateTimerDisplay();
    
    timer = setInterval(() => {
        timeLeft--;
        updateTimerDisplay();

        if (timeLeft <= 0) {
            clearInterval(timer);
            nextQuestion(); // Move to next question automatically
        }
    }, 1000);
}

// Update timer display
function updateTimerDisplay() {
    let timerElement = document.querySelector(".timer");
    if (timerElement) {
        let minutes = Math.floor(timeLeft / 60);
        let seconds = timeLeft % 60;
        timerElement.innerText = `${minutes}:${seconds < 10 ? "0" : ""}${seconds}`;
    }
}


function saveResponse() {
    let reviewCheckbox = document.getElementById("markReview");
    if (!reviewCheckbox) {
        console.error("Error: 'markReview' checkbox not found.");
        return;
    }

    let questionData = questions[currentQuestionIndex];
    let selectedOptions = document.querySelectorAll(`input[name="question_${questionData.id}[]"]:checked`);
    let selectedValues = [...selectedOptions].map(option => option.value);

    if (questionData.multipleChoice) {
        userResponses[questionData.id] = selectedValues;  // Store as an array
    } else {
        let singleSelection = document.querySelector(`input[name="question_${questionData.id}"]:checked`);
        userResponses[questionData.id] = singleSelection ? singleSelection.value : null;
    }

    if (reviewCheckbox.checked) {
        reviewQuestions[questionData.id] = questionData; 
    } else {
        delete reviewQuestions[questionData.id]; 
    }

    localStorage.setItem("reviewQuestions", JSON.stringify(reviewQuestions));
    localStorage.setItem("userResponses", JSON.stringify(userResponses));
}


function nextQuestion() {
    saveResponse();
    if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        showQuestion();
    } else {
		clearInterval(timer);
        window.location.href = "review.html";
    }
}

function previousQuestion() {
    saveResponse();
    if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
        showQuestion();
    }
}
