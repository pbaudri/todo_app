class Task {
  Task({
    required this.name,
    this.isDone = false,
    required this.date,
  });

  String name;
  bool isDone;
  DateTime date;

  set setDoneValue(bool newIsDone) {
    isDone = newIsDone;
  }
}
