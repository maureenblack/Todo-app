class Todo {
  static int _id = 1; //fix ID incrementation.
  int id;
  final String? text;
  bool done;
  String priority;
  int pt;
  String createdTime;
  String dueDate;

  Todo(this.text, this.dueDate, this.priority, this.createdTime)
      : id = _id++,
        done = false,
        pt = int.parse(priority);
  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'],
        dueDate = json['dueDate'],
        pt = json['pt'],
        priority = json['priority'],
        createdTime = json['createdTime'],
        done = json['done'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'dueDate': dueDate,
        'pt': pt,
        'priority': priority,
        'createdTime': createdTime,
        'done': done
      };
}
