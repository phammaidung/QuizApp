class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final currentList = List.of(answers);
    currentList.shuffle();
    return currentList;
  }
}
