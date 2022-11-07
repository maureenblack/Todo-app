import 'dart:html';
import 'Todo.dart';
import 'main.dart';

int _id = 0;
void test(int id, event) async {
  // event.preventDefault();
  print('test function called $id with eveent $event');
  completeTodo;
}

void completeTodo(MouseEvent event) {
  print('complete Task called');
  event.stopPropagation();

  Element? div = (event.currentTarget as Element).parent?.parent;
  Element button = (event.currentTarget as Element);

  int key = int.parse(button.id.split('-')[0]);
  print("The id is $key");
  Iterable<Todo?> complete = todoList.where((todo) => todo?.id == key);
  // comList.add(complete);
  print("this task was just completed ${complete.first!.text}");
  comList.add(complete.first);
  print("Length of complete list is ${comList.length}");

  todoList.removeWhere((todo) => todo?.id == key);
  div!.remove();
  updateCompleteList();
}

void updateCompleteList() {
  uiCompleteList.children.clear();

  comList.forEach((todo) {
    DivElement div = DivElement();
    Element spanTwo = Element.div();
    ButtonElement buttonRemove = ButtonElement();
    Element span = Element.span();
    ButtonElement doneButton = ButtonElement();

    // div elements in the todo list
    Element colOne = Element.div();
    Element colTwo = Element.div();
    Element colThree = Element.div();
    Element colFour = Element.div();
    Element colFive = Element.div();

    buttonRemove.className = 'btn btn-primary';
    buttonRemove.id = todo!.id.toString();

    buttonRemove.text = 'clear';

    doneButton.text = 'Completed';
    // doneButton.onClick.listen(completeTodo);
    doneButton.className = 'btn btn-success complete';
    doneButton.id = todo.id.toString();

    //First column in the todo list
    colOne.className = 'col-2 lend';
    colOne.appendHtml('<li ></li>');
    // colOne.appendHtml(todo.id.toString());
    div.children.add(colOne);

    //Second column in the todo list
    colTwo.className = 'col';
    colTwo.appendHtml(todo.text.toString());
    div.children.add(colTwo);

    //Third column in the todo list
    colThree.className = 'col';
    // late String demoText = todo.done ? 'completed' : 'in progress';
    late String demoText = 'completed';
    colThree.appendHtml(demoText);
    // div.children.add(colThree);

    //Four column in the todo list
    colFour.className = 'col';
    colFour.appendHtml(todo.priority.toString());
    div.children.add(colFour);

    spanTwo.children.add(doneButton);
    spanTwo.className = 'col';

    // div.children.add(span);
    div.children.add(spanTwo);

    div.className =
        'odoClass px-3  rounded border-botom border-3 border-warning';
    uiCompleteList.children.add(div);
  });
}

void removeAllTodos(MouseEvent event) {
  uiList.children.clear();
  todoList.clear();
}
