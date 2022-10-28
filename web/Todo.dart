class Todo {
  static int _id = 1; //fix ID incrementation.
  int id;
  final String? text;
  bool done;
  String priority;
  DateTime createdTime;
  String dueDate;

  Todo(this.text, this.dueDate, this.priority)
      : this.id = _id++,
        this.createdTime = DateTime.now(),
        this.done = false;
}
