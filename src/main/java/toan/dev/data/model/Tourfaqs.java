package toan.dev.data.model;

public class Tourfaqs {
    public int faq_id;
    public int tour_id;
    public String question;
    public String answer;

    public int getFaq_id() {
        return faq_id;
    }

    public void setFaq_id(int faq_id) {
        this.faq_id = faq_id;
    }

    public int getTour_id() {
        return tour_id;
    }

    public void setTour_id(int tour_id) {
        this.tour_id = tour_id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Tourfaqs(int faq_id, int tour_id, String question, String answer) {
        super();
        this.faq_id = faq_id;
        this.tour_id = tour_id;
        this.question = question;
        this.answer = answer;
    }
}
