import 'dart:html';
import 'dart:js_util';

import 'Todo.dart';
import 'addTodo.dart';
import 'sort.dart';
import 'storage.dart';

// Declaration of the variables
late InputElement todoInput;
late SelectElement priority;
late SelectElement sort;
late InputElement date;
late DivElement uiList;
late DivElement uiCompleteList;
late ButtonElement addButton;
late TableElement table;
late FormElement form;
late DivElement emptyList;

List<Todo?> todoList = [];
List<Todo?> comList = [];

Future<void> main() async {
  // Initialization of the variables
  todoInput = querySelector('#todoInput') as InputElement;
  date = querySelector('#datepicker') as InputElement;
  priority = querySelector('#priority') as SelectElement;
  sort = querySelector('#sort') as SelectElement;
  uiList = querySelector('#todo-list') as DivElement;
  uiCompleteList = querySelector('#todo-complete') as DivElement;
  addButton = querySelector('#addBtn') as ButtonElement;
  emptyList = querySelector('#empty-list') as DivElement;

  await getStorage();
  await getCompleteStorage();
  addButton.onClick.listen(addTodo);
  sort.onChange.listen((event) {
    sortList(sort.value.toString());
  });

  await todoInput.onKeyUp.contains('Enter') ? addTodo : null;
}
