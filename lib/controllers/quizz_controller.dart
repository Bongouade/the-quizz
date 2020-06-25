import '../models/question.dart';

class QuizzController {
  List<QuestionModel> _question = [
    QuestionModel("La durée d’un jour a toujours été de 24 heures", false),
    QuestionModel("Les éléphants ont peur des souris", false),
    QuestionModel("Certaines pierres flottent sur l’eau", true),
    QuestionModel(
        "Les autruches mettent la tête dans le sable quand elles ont peur",
        false),
    QuestionModel(
        "Aux États-Unis, il n’y a pas d’étage nº 13 dans les immeubles", true),
    QuestionModel("L’homme a plus de poils que la femme", false),
    QuestionModel("Le taureau est excité par la couleur rouge", false),
    QuestionModel("Le poisson rouge a une mémoire de quelques secondes", false),
    QuestionModel(
        "Les connexions Wi-Fi peuvent être perturbées par les fours à micro-ondes",
        true),
    QuestionModel("Il fait plus froid au pôle Sud qu’au pôle Nord", true),
    QuestionModel(
        "La Grande Muraille de Chine est la seule construction humaine visible depuis la Lune",
        false),
    QuestionModel("Les chutes du Niagara peuvent geler", true),
    QuestionModel("Il est impossible d’éternuer les yeux ouverts", true),
  ];

  String getQuestionText(int indexQuestion) {
    return _question[indexQuestion].question;
  }

  bool getAnswer(int indexQuestion) {
    return _question[indexQuestion].answer;
  }

  int getLenght() {
    return _question.length;
  }

  void shuffleQuestion() {
    _question.shuffle();
  }
}
