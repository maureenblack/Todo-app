import 'dart:html';
import 'Todo.dart';
import 'main.dart';
import 'updateTodo.dart';

void addTodo(Event event) {
  if (todoInput.value == '') return;
  Todo todo =
      Todo(todoInput.value, date.value.toString(), priority.value.toString());
  todoList.add(todo);

  updateTodos();
  todoInput.value = '';
}
