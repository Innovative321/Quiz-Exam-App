let totalTime = parseInt(localStorage.getItem("remainingTime")) || 3600; // 60 mins default
let timerInterval;

function updateTimerDisplay() {
    const timerElement = document.querySelector(".timer");
    if (timerElement) {
        const minutes = Math.floor(totalTime / 60);
        const seconds = totalTime % 60;
        timerElement.innerText = `${minutes}:${seconds < 10 ? "0" : ""}${seconds}`;
    }
}

function startReviewTimer() {
    clearInterval(timerInterval); // prevent multiple intervals
    updateTimerDisplay(); // Initial display
    timerInterval = setInterval(() => {
        totalTime--;
        localStorage.setItem("remainingTime", totalTime);
        updateTimerDisplay();

        if (totalTime <= 0) {
            clearInterval(timerInterval);
            Swal.fire("Time's up!", "Your quiz will be submitted automatically.", "warning")
                .then(() => {
                    submitQuiz(); // Auto submit when time runs out
                });
        }
    }, 1000);
}

document.addEventListener("DOMContentLoaded", function () {
	startReviewTimer();
    let reviewContainer = document.getElementById("reviewContainer");
    if (!reviewContainer) {
        console.error("Error: 'reviewContainer' not found.");
        return;
    }

    let storedData = localStorage.getItem("reviewQuestions");
    let reviewQuestions = JSON.parse(storedData) || {};
    let userResponses = JSON.parse(localStorage.getItem("userResponses") || "{}");

    if (Object.keys(reviewQuestions).length === 0) {
        reviewContainer.innerHTML = "<p>No questions marked for review.</p>";
        return;
    }

    Object.values(reviewQuestions).forEach((question, index) => {
        if (!question || typeof question !== "object" || !question.question) {
            console.error("Skipping invalid question:", question);
            return;
        }

        let div = document.createElement("div");
        div.classList.add("mb-3");

        let questionTitle = document.createElement("h4");
        questionTitle.innerText = `${index + 1}. ${question.question}`;
        div.appendChild(questionTitle);

        let inputType = question.multipleChoice ? "checkbox" : "radio";
        let selectedAnswers = userResponses[question.id] || [];

        if (!Array.isArray(selectedAnswers)) {
            selectedAnswers = selectedAnswers ? [selectedAnswers] : [];
        }

        ["option1", "option2", "option3", "option4"].forEach(optionKey => {
            if (!question[optionKey]) return;

            let optionDiv = document.createElement("div");
            optionDiv.classList.add("form-check");

            let input = document.createElement("input");
            input.type = inputType;
            input.name = `question_${question.id}`;
            input.value = question[optionKey];
            input.classList.add("form-check-input");

            // Restore selected answers
            input.checked = selectedAnswers.includes(question[optionKey]);

            input.addEventListener("change", function () {
                updateUserResponse(question.id, question.multipleChoice, this.value, this.checked);
            });

            let label = document.createElement("label");
            label.classList.add("form-check-label");
            label.innerText = question[optionKey];

            optionDiv.appendChild(input);
            optionDiv.appendChild(label);
            div.appendChild(optionDiv);
        });

        reviewContainer.appendChild(div);
    });
});

// Function to update user responses in localStorage
function updateUserResponse(questionId, isMultipleChoice, value, isChecked) {
    let responses = JSON.parse(localStorage.getItem("userResponses") || "{}");

    if (isMultipleChoice) {
        if (!Array.isArray(responses[questionId])) {
            responses[questionId] = [];
        }
        if (isChecked) {
            if (!responses[questionId].includes(value)) {
                responses[questionId].push(value);
            }
        } else {
            responses[questionId] = responses[questionId].filter(ans => ans !== value);
        }
    } else {
        responses[questionId] = value;
    }

    localStorage.setItem("userResponses", JSON.stringify(responses));
}

// Function to go back to the quiz and restore the last viewed question
function backToQuiz() {
    const savedQuestions = localStorage.getItem("quizQuestions");

    if (savedQuestions != null) {
        // fallback to previously stored currentQuestionIndex in localStorage
        const lastIndex = localStorage.getItem("currentQuestionIndex") || 0;
        localStorage.setItem("redirectToQuestion", lastIndex);
		//alert(lastIndex)
        window.location.href = "quiz.html";
    } else {
        alert("Unable to restore your previous quiz. Please restart.");
    }
}


// Function to submit the quiz
function submitQuiz() {
    let userId = localStorage.getItem("userId") || "guest"; // Use a default value if userId is missing
    let responses = JSON.parse(localStorage.getItem("userResponses") || "{}");
	
		localStorage.removeItem("quizQuestions");
	    localStorage.removeItem("redirectToQuestion");
	    localStorage.removeItem("userResponses");
	    localStorage.removeItem("reviewQuestions");
	    localStorage.removeItem("currentQuestionIndex");
	    localStorage.setItem("testStarted", "false");

    console.log("Submitting responses:", responses);
	// Clear question set so next quiz is fresh
   localStorage.removeItem("questions");
   localStorage.setItem("testStarted", "false");

    fetch("/quiz/submit", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ userId: userId, responses: responses })
    })
    .then(response => response.text())
    .then(data => {
        console.log("Server Response:", data);
        Swal.fire({
            title: "Success!",
            text: "Your quiz has been submitted successfully!",
            icon: "success",
            confirmButtonText: "OK"
        }).then(() => {
            window.location.href = "index.html";
        });
    })
    .catch(error => {
        console.error("Error submitting quiz:", error);
        Swal.fire({
            title: "Error!",
            text: "There was an issue submitting your quiz. Please try again.",
            icon: "error",
            confirmButtonText: "OK"
        });
    });
}
