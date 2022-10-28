import 'dart:html';
import 'main.dart';
import 'removeTodo.dart';

void updateTodos() {
  uiList.children.clear();

  if (todoList.isNotEmpty) {
    emptyList.className = 'd-none';
  }

  todoList.forEach((todo) {
    DateTime fomatter = DateTime.parse(todo!.dueDate);
    String createdFormatted =
        "${fomatter.year.toString()}-${fomatter.month.toString().padLeft(2, '0')}-${fomatter.day.toString().padLeft(2, '0')}";
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

    doneButton.text = 'Done';
    doneButton.onClick.listen(completeTodo);
    doneButton.className = 'btn btn-success uncomplete';
    doneButton.id = todo.id.toString();

    //First column in the todo list
    colOne.className = 'col-2 lend';
    colOne.appendHtml('<li style="margin-left:-100px;"></li>');
    // colOne.appendHtml(todo.id.toString());
    div.children.add(colOne);

    //Second column in the todo list
    colTwo.className = 'col title';
    colTwo.appendHtml(todo.text.toString());
    div.children.add(colTwo);

    //Third column in the todo list
    colThree.className = 'col row';
    late String demoText = todo.done ? 'completed' : 'in progress';
    colThree.appendHtml(demoText);

    colThree
        .appendHtml('<div class="row text-warning"> $createdFormatted</div>');

    div.children.add(colThree);

    //Four column in the todo list
    colFour.className = 'col';
    colFour.appendHtml(todo.priority.toString());
    div.children.add(colFour);

    spanTwo.children.add(doneButton);
    if (DateTime.now().isAfter(DateTime.parse(todo.dueDate))) {
      spanTwo.appendHtml(
          '<div class="d-flex row col-12 text-danger text-center justify-content-end"> OverDue</div>');
    }
    spanTwo.className = 'col row';

    // div.children.add(span);
    div.children.add(spanTwo);

    div.className =
        'todoClass px-3  rounded border-botom border-3 border-warning';
    uiList.children.add(div);
  });
}
