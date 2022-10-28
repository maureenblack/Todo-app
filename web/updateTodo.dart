import 'dart:html';
import 'main.dart';
import 'removeTodo.dart';

void updateTodos() {
  uiList.children.clear();

  todoList.forEach((todo) {
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
    buttonRemove.onClick.listen(removeTodo);
    buttonRemove.text = 'clear';

    doneButton.text = 'Done';
    doneButton.className = 'btn btn-success uncomplete';
    doneButton.id = todo.id.toString();

    //First column in the todo list
    colOne.className = 'col-2 lend';
    colOne.appendHtml('<li style="margin-left:-100px;"></li>');
    // colOne.appendHtml(todo.id.toString());
    div.children.add(colOne);

    //Second column in the todo list
    colTwo.className = 'col';
    colTwo.appendHtml(todo.text.toString());
    div.children.add(colTwo);

    //Third column in the todo list
    colThree.className = 'col';
    late String demoText = todo.done ? 'completed' : 'in progress';
    colThree.appendHtml(demoText);
    div.children.add(colThree);

    //Four column in the todo list
    colFour.className = 'col';
    colFour.appendHtml(todo.priority.toString());
    div.children.add(colFour);

    spanTwo.children.add(doneButton);
    spanTwo.className = 'col';

    // div.children.add(span);
    div.children.add(spanTwo);

    div.className = 'todoClass rounded border-botom border-3 border-warning';
    uiList.children.add(div);
  });
}
