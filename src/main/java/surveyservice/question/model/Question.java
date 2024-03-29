package surveyservice.question.model;

import lombok.*;
import surveyservice.response.model.Answer;
import surveyservice.survey.model.Survey;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder(toBuilder = true)
@Entity
@Table(name = "QUESTION")
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "question_sequence")
    @SequenceGenerator(name = "question_sequence", sequenceName = "SEQ_QUESTION_ID", allocationSize = 1)
    @Column(name = "ID")
    private Long id;

    @Column(name = "TITLE")
    private String title;

    @ManyToOne
    @JoinColumn(name = "SURVEY_ID")
    private Survey survey;

    @OneToMany(mappedBy = "question", orphanRemoval = true, cascade = CascadeType.ALL)
    private List<Choice> choiceList;

    @OneToOne(mappedBy = "question", orphanRemoval = true)
    private Answer answer;

    public List<Choice> getChoiceList() {
        return choiceList == null ? List.of() : choiceList;
    }

    public void setChoiceList(List<Choice> choices) {
        choices.forEach(choice -> choice.setQuestion(this));
        choiceList = choices;
    }

}
