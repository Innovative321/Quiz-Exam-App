package ia.quizapp.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import ia.quizapp.modal.Question;

public interface QuestionRepository extends JpaRepository<Question, Long>{

}
