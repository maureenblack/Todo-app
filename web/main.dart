import 'dart:html';

InputElement? todoInput;
DivElement? uiList;
ButtonElement? buttonClear;

List<Todo?> todoList = [];

void main() {
  todoInput = querySelector('#todo') as InputElement;
  uiList = querySelector('#todo-list') as DivElement;
  buttonClear = querySelector('#clear') as ButtonElement;

  todoInput!.onChange.listen(addTodo);
  buttonClear!.onClick.listen(removeAllTodos);
}

void addTodo(Event event) {
  Todo todo = Todo(todoInput!.value);
  todoList.add(todo);

  updateTodos();
  todoInput!.value = '';
}

void updateTodos() {
  uiList!.children.clear();

  todoList.forEach((todo) {
    DivElement div = DivElement();
    Element spanTwo = Element.span();
    ButtonElement buttonRemove = ButtonElement();
    Element span = Element.span();
    ButtonElement doneButton = ButtonElement();

    buttonRemove.className = 'btn';
    buttonRemove.id = todo!.id.toString();
    buttonRemove.onClick.listen(removeTodo);
    buttonRemove.text = 'clear';

    if (!todo.done) {
      doneButton.text = 'done';
      doneButton.className = 'btn uncomplete';
    } else {
      doneButton.text = 'completed';
      doneButton.className = 'btn completed';
    }

    doneButton.id = todo.id.toString();

    // doneButton.onClick.listen(removeTodo);

    span.text = todo.text;
    // spanTwo.children.add()
    spanTwo.children.add(buttonRemove);
    spanTwo.children.add(doneButton);
    spanTwo.className = 'btnClass';

    div.children.add(span);
    div.children.add(spanTwo);

    div.className = 'todoClass';
    uiList!.children.add(div);
  });
}

void removeTodo(MouseEvent event) {
  event.stopPropagation();

  Element? div = (event.currentTarget as Element).parent?.parent;
  Element button = (event.currentTarget as Element);

  int key = int.parse(button.id.split('-')[0]);
  todoList.removeWhere((todo) => todo?.id == key);

  div!.remove();
}

void removeAllTodos(MouseEvent event) {
  uiList?.children.clear();
  todoList.clear();
}

class Todo {
  static int _id = 0; //fix ID incrementation.
  int id;
  final String? text;
  bool done;

  Todo(
    this.text,
  )   : this.id = _id++,
        this.done = true;
}
