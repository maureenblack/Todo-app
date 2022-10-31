import 'dart:html';
import 'main.dart';
import 'removeTodo.dart';
import 'updateTodo.dart';

void sortList(String value) {
  if (value == 'name') {
    return todoList.sort((a, b) {
      String x = a!.text!.toLowerCase();
      String y = b!.text!.toLowerCase();
      if (x.compareTo(y) < 0) return -1;
      if (x.compareTo(y) > 0) return 1;
      print('sorting by name');
      return 0;
    });
  }
  if (value == 'priority') {
    print('sorting by name');

    return todoList.sort((a, b) => b!.pt - a!.pt);
  } else {
    print('parameter unknown');
    print(value);
  }
  updateTodos();
}
