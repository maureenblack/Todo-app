import 'dart:html';
import 'Todo.dart';
import 'addTodo.dart';
import 'removeTodo.dart';

late InputElement todoInput;
late SelectElement priority;
late InputElement date;
late DivElement uiList;
late ButtonElement buttonClear;
late TableElement table;
late FormElement form;

List<Todo?> todoList = [];

void main() {
  todoInput = querySelector('#todo') as InputElement;
  date = querySelector('#datepicker') as InputElement;
  priority = querySelector('#priority') as SelectElement;
  uiList = querySelector('#todo-list') as DivElement;
  buttonClear = querySelector('#clear') as ButtonElement;
  // form = querySelector('#add') as FormElement;

  todoInput.onChange.listen(addTodo);
  buttonClear.onClick.listen(removeAllTodos);
}
