import 'dart:html';

import 'Todo.dart';
import 'addTodo.dart';

// Declaration of the variables
late InputElement todoInput;
late SelectElement priority;
late InputElement date;
late DivElement uiList;
late DivElement uiCompleteList;
late ButtonElement buttonClear;
late TableElement table;
late FormElement form;

List<Todo?> todoList = [];
List<Todo?> comList = [];

void main() {
  // Initialization of the variables
  todoInput = querySelector('#todo') as InputElement;
  date = querySelector('#datepicker') as InputElement;
  priority = querySelector('#priority') as SelectElement;
  uiList = querySelector('#todo-list') as DivElement;
  uiCompleteList = querySelector('#todo-complete') as DivElement;
  buttonClear = querySelector('#clear') as ButtonElement;

  todoInput.onChange.listen(addTodo);
}
