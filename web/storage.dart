import 'dart:convert';
import 'dart:html';
import 'Todo.dart';
import 'main.dart';
import 'removeTodo.dart';
import 'updateTodo.dart';

// late Storage storage;
late dynamic arrTodos;
late dynamic arrdone;
late int lastIndex;
late int lastIndexDone;

getStorage() {
  print('\n Getting Local storage...');

  arrTodos = window.localStorage['todos'];
  print(arrTodos);
  if (arrTodos == "" || (arrTodos == null)) {
    window.localStorage['todos'] = todoList.toString();
    arrTodos = window.localStorage['todos'];
  }
  print("getStorage called");
  print(arrTodos);

  final todos = jsonDecode(arrTodos);

  print(todos);

  todos.forEach((element) {
    Todo singleTodo = Todo.fromJson(element);
    todoList.add(singleTodo);
    print(singleTodo.id);
  });

  if (todoList.isEmpty) {
    lastIndex = 0;
  } else {
    lastIndex = todoList.elementAt(todoList.length - 1)!.id;
  }
  print(lastIndex);

  updateTodos();
  print('Finished Getting Local storage...');
  return todoList;
}

// get completed list
getCompleteStorage() {
  print('\n Getting Local storage...');

  arrdone = window.localStorage['completed'];
  print(arrTodos);
  if (arrdone == "" || (arrdone == null)) {
    window.localStorage['completed'] = comList.toString();
    arrdone = window.localStorage['completed'];
  }
  print("getCompletedStorage called");
  print(arrdone);

  final completed = jsonDecode(arrdone);

  print(completed);

  completed.forEach((element) {
    Todo singleTodo = Todo.fromJson(element);
    comList.add(singleTodo);
    print(singleTodo.id);
  });

  if (comList.isEmpty) {
    lastIndexDone = 0;
  } else {
    lastIndexDone = comList.elementAt(comList.length - 1)!.id;
  }
  print(lastIndexDone);

  updateCompleteList();
  print('Finished Getting Local storage...');
  return comList;
}

addStorage(List todolist) {
  print('\n adding to local storage');
  window.localStorage["todos"] = jsonEncode(todolist);
  final done = window.localStorage['todos'];

  print(done);

  print('\n done adding');
}

// add completed storage
addCompleteStorage(List doneList) {
  print('\n adding completed to local storage');
  window.localStorage["completed"] = jsonEncode(doneList);
  final done = window.localStorage['completed'];

  print(done);

  print('\n done adding');
}
