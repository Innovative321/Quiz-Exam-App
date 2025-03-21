package ia.quizapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import ia.quizapp.modal.Question;
import ia.quizapp.modal.User;
import ia.quizapp.repo.QuestionRepository;
import ia.quizapp.repo.UserRepository;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/quiz")  // Base endpoint for quiz operations
@CrossOrigin(origins = "*")  // Allow frontend access
public class QuizController {

    private final QuestionRepository questionRepository;
    private final UserRepository userRepository;

    @Autowired
    public QuizController(QuestionRepository questionRepository, UserRepository userRepository) {
        this.questionRepository = questionRepository;
        this.userRepository = userRepository;
    }

    // Get all questions from the database
    @GetMapping("/questions")
    public ResponseEntity<List<Question>> getAllQuestions() {
        List<Question> questions = questionRepository.findAll();
        if (questions.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(questions);
    }
    
//    @PostMapping("/submit")
//    public ResponseEntity<String> submitQuiz(@RequestBody Map<String, Object> requestData) {
//        if (!requestData.containsKey("userId") || !requestData.containsKey("responses")) {
//            return ResponseEntity.badRequest().body("Missing userId or responses.");
//        }
//
//        Long userId;
//        try {
//            userId = Long.parseLong(requestData.get("userId").toString());
//        } catch (NumberFormatException e) {
//            return ResponseEntity.badRequest().body("Invalid userId format.");
//        }
//
//        Map<String, Object> responses = (Map<String, Object>) requestData.get("responses"); // Use Object to handle both String & List<String>
//
//        System.out.println("Received Responses: " + responses);
//
//        int score = 0;
//        List<Question> questions = questionRepository.findAll();
//
//        for (Question q : questions) {
//            String correctAnswer = q.getCorrectAnswers().trim().toLowerCase();
//            Object userResponse = responses.get(q.getId().toString());
//
//            if (userResponse instanceof String) {
//                // ✅ Single-choice question
//                String userAnswer = ((String) userResponse).trim().toLowerCase();
//                if (userAnswer.equals(correctAnswer)) {
//                    score++;
//                }
//            } else if (userResponse instanceof List) {
//                // ✅ Multiple-choice question
//                List<String> userAnswers = (List<String>) userResponse;
//                List<String> correctAnswers = List.of(correctAnswer.split(",")); // Assuming CSV format for multiple answers
//
//                if (userAnswers.stream().map(String::trim).map(String::toLowerCase).sorted()
//                        .equals(correctAnswers.stream().map(String::trim).map(String::toLowerCase).sorted())) {
//                    score++;
//                }
//            }
//        }
//
//        System.out.println("Calculated Score: " + score);
//
//        User user = userRepository.findById(userId).orElse(null);
//        if (user == null) {
//            return ResponseEntity.badRequest().body("User not found.");
//        }
//
//        user.setScore(score);
//        userRepository.save(user);
//
//        return ResponseEntity.ok("Final Score: " + score);
//    }
    
    @PostMapping("/submit")
    public ResponseEntity<String> submitQuiz(@RequestBody Map<String, Object> requestData) {
        if (!requestData.containsKey("userId") || !requestData.containsKey("responses")) {
            return ResponseEntity.badRequest().body("Missing userId or responses.");
        }

        Long userId;
        try {
            userId = Long.parseLong(requestData.get("userId").toString());
        } catch (NumberFormatException e) {
            return ResponseEntity.badRequest().body("Invalid userId format.");
        }

        Map<String, Object> responses = (Map<String, Object>) requestData.get("responses");

        System.out.println("Received Responses: " + responses);

        int score = 0;
        List<Question> questions = questionRepository.findAll();

        for (Question q : questions) {
            String correctAnswer = q.getCorrectAnswers().trim().toLowerCase();
            Object userResponse = responses.get(q.getId().toString());

            if (userResponse instanceof String) {
                // ✅ Single-choice question
                String userAnswer = ((String) userResponse).trim().toLowerCase();
                if (userAnswer.equals(correctAnswer)) {
                    score++;
                }
            } else if (userResponse instanceof List) {
                // ✅ Multiple-choice question
                List<String> userAnswers = (List<String>) userResponse;
                List<String> correctAnswers = List.of(correctAnswer.split(",")); // Convert stored answer to list

                // Trim spaces and convert both lists to lowercase
                List<String> formattedUserAnswers = userAnswers.stream()
                        .map(String::trim)
                        .map(String::toLowerCase)
                        .sorted()
                        .toList();

                List<String> formattedCorrectAnswers = correctAnswers.stream()
                        .map(String::trim)
                        .map(String::toLowerCase)
                        .sorted()
                        .toList();

                if (formattedUserAnswers.equals(formattedCorrectAnswers)) {
                    score++;
                }
            }
        }

        System.out.println("Calculated Score: " + score);

        User user = userRepository.findById(userId).orElse(null);
        if (user == null) {
            return ResponseEntity.badRequest().body("User not found.");
        }

        user.setScore(score);
        userRepository.save(user);

        return ResponseEntity.ok("Final Score: " + score);
    }



    @PostMapping("/submit-answer")
    public ResponseEntity<String> submitAnswer(@RequestBody Question response) {
        if (response.isMultipleChoice() && response.getSelectedAnswers() != null) {
            System.out.println("Received multiple answers: " + response.getSelectedAnswers());
        } else {
            System.out.println("Received single answer: " + response.getSelectedAnswers());
        }

        return ResponseEntity.ok("Answer submitted successfully");
    }
}
