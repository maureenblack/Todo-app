import 'dart:html';
import 'class/Todo.dart';
import 'components/updateTodo.dart';
import 'components/storage.dart';
import 'main.dart';
import 'components/sort.dart';

void test(int id, event) async {
  // event.preventDefault();
  print('test function called $id with eveent $event');
  completeTodo;
}

void completeTodo(int id) {
  print('complete Task called');
  Todo? todo = todoList.elementAt(id);

  // event.stopPropagation();

  // Element? div = (event.currentTarget as Element).parent?.parent;
  // Element button = (event.currentTarget as Element);

  // int key = int.parse(button.id.split('-')[0]);
  print("The id is ${todo!.id}");
  // Iterable<Todo?> complete = todoList.where((todo) => todo?.id == key);
  comList.add(todo);
  print("this task was deleted${todo.text}");
  // comList.add(complete.first);
  print("Length of complete list is ${comList.length}");

  // todoList.removeWhere((todo) => todo?.id == key);
  // div!.remove();
  // removeTodos(id);
  addCompleteStorage(comList);
  updateCompleteList();
}

void updateCompleteList() {
  uiCompleteList.children.clear();
  sortList("priority", comList);

  comList.forEach((todo) {
    DivElement div = DivElement();
    Element spanTwo = Element.div();
    ButtonElement buttonDelete = ButtonElement();
    Element span = Element.span();
    ButtonElement doneButton = ButtonElement();

    // div elements in the todo list
    Element colOne = Element.div();
    Element colTwo = Element.div();
    Element colThree = Element.div();
    Element colFour = Element.div();

    buttonDelete.className = 'btn btn-outlined';
    buttonDelete.id = todo!.id.toString();

    buttonDelete.text = 'delete';

    doneButton.text = '';
    // doneButton.onClick.listen(completeTodo);
    doneButton.className = 'btn btn-outlined';
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
    // late String demoText = todo.done ? '' : 'in progress';
    late String demoText = '';
    colThree.appendHtml(demoText);
    // div.children.add(colThree);

    //Four column in the todo list
    // colFour.className = 'col';
    // colFour.appendHtml(todo.priority.toString());
    if (todo.priority.toString() == '3') {
      colFour.className = 'text-danger col  rounded-pill';
      colFour.appendHtml('high');
    } else if (todo.priority.toString() == '2') {
      colFour.className = 'text-warning col  rounded-pill';
      colFour.appendHtml('medium');
    } else {
      colFour.className = 'text-success col  rounded-pill';
      colFour.appendHtml('low');
    }
    div.children.add(colFour);

    spanTwo.children.add(doneButton);
    spanTwo.className = 'col';

    // div.children.add(span);
    div.children.add(spanTwo);

    div.className =
        'todoClass px-3  rounded border-botom border-3 border-warning';
    uiCompleteList.children.add(div);
  });
}

void removeTodo(MouseEvent event) {
  // uiList.parent.clear();
  todoList.clear();
}
