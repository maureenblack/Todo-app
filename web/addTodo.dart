import 'dart:html';
import 'Todo.dart';
import 'main.dart';
import 'storage.dart';
import 'updateTodo.dart';

void addTodo(Event event) {
  if (todoInput.value == '') return;
  final dt = DateTime.now();
  Todo todo = Todo(todoInput.value, date.value.toString(),
      priority.value.toString(), dt.toString());
  todoList.add(todo);

  updateTodos();
  test();
  todoInput.value = '';
  addStorage(todoList);
}
