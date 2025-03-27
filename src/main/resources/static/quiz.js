let questions = [];
let currentQuestionIndex = 0;
let userResponses = {};
let reviewQuestions = {};

// Fetch questions from the backend
document.addEventListener("DOMContentLoaded", function () {
    fetch("https://innovativeacademy.online/quiz/questions")
        .then(response => response.json())
        .then(data => {
            questions = data;
            showQuestion();
        })
        .catch(error => console.error("Error fetching questions:", error));
});

function showQuestion() {
    if (currentQuestionIndex < 0 || currentQuestionIndex >= questions.length) return;

    let questionData = questions[currentQuestionIndex];
    document.getElementById("question").innerText = questionData.question;

    let optionsContainer = document.getElementById("options");
    optionsContainer.innerHTML = "";

    ["option1", "option2", "option3", "option4"].forEach((optionKey) => {
        let div = document.createElement("div");
        div.classList.add("form-check");

        let input = document.createElement("input");
        input.type = "radio";
        input.name = "option";
        input.value = questionData[optionKey];
        input.classList.add("form-check-input");

        if (userResponses[questionData.id] === questionData[optionKey]) {
            input.checked = true;
        }

        let label = document.createElement("label");
        label.classList.add("form-check-label");
        label.innerText = questionData[optionKey];

        div.appendChild(input);
        div.appendChild(label);
        optionsContainer.appendChild(div);
    });

    let reviewCheckbox = document.getElementById("markReview");
    if (reviewCheckbox) {
        reviewCheckbox.checked = reviewQuestions[questionData.id] || false;
    }
}

function saveResponse() {
    let reviewCheckbox = document.getElementById("markReview");
    if (!reviewCheckbox) {
        console.error("Error: 'markReview' checkbox not found.");
        return;
    }

    let questionData = questions[currentQuestionIndex];
    let selectedOption = document.querySelector('input[name="option"]:checked');

    if (selectedOption) {
        userResponses[questionData.id] = selectedOption.value; 
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
