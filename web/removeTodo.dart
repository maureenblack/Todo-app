import 'dart:html';
import 'main.dart';

void removeTodo(MouseEvent event) {
  event.stopPropagation();

  Element? div = (event.currentTarget as Element).parent?.parent;
  Element button = (event.currentTarget as Element);

  int key = int.parse(button.id.split('-')[0]);
  todoList.removeWhere((todo) => todo?.id == key);

  div!.remove();
}

void removeAllTodos(MouseEvent event) {
  uiList.children.clear();
  todoList.clear();
}
