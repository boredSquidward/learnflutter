class QuestionClass {
  const QuestionClass(this.question, this.answers);

  final String question;
  final List<String> answers;

  getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
