import 'dart:html';
import 'Todo.dart';
import 'addTodo.dart';
import 'main.dart';
import 'removeTodo.dart';

void updateTodos() async {
  uiList.children.clear();

  if (todoList.isNotEmpty) {
    emptyList.className = 'd-none';
  }

  todoList.forEach((todo) async {
    int index = todoList.indexOf(todo);
    DateTime fomatter = DateTime.parse(todo!.dueDate);
    String createdFormatted =
        "${fomatter.year.toString()}-${fomatter.month.toString().padLeft(2, '0')}-${fomatter.day.toString().padLeft(2, '0')}";
    DivElement div = DivElement();
    Element spanTwo = Element.div();
    ButtonElement buttonRemove = ButtonElement();
    Element span = Element.span();
    ButtonElement doneButton = ButtonElement();
    InputElement checkbox = InputElement();
    checkbox.type = 'checkbox';
    checkbox.onChange.listen((event) {
      test(todo.id, event);
    });

    // div elements in the todo list
    Element colOne = Element.div();
    Element colTwo = Element.div();
    Element colThree = Element.div();
    Element colFour = Element.div();
    Element colFive = Element.div();

    buttonRemove.className = 'btn btn-primary fas fa-pen me-3';
    // buttonRemove.id = todo.id.toString();
    buttonRemove.id = todoList.indexOf(todo).toString();

    buttonRemove.text = 'Edit';
    buttonRemove.onClick.listen((event) => {editTodos(index)});

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
        .appendHtml('<div class="row text-success"> $createdFormatted</div>');

    div.children.add(colThree);

    //Four column in the todo list
    if (todo.priority.toString() == '3') {
      colFour.className =
          'justify-content-center text-danger col  rounded-pill';
      colFour.appendHtml('high');
    } else if (todo.priority.toString() == '2') {
      colFour.className =
          ' justify-content-center text-warning col  rounded-pill';
      colFour.appendHtml('medium');
    } else {
      colFour.className =
          ' justify-content-center text-success col  rounded-pill';
      colFour.appendHtml('low');
    }
    div.children.add(colFour);

    spanTwo.children.add(doneButton);
    spanTwo.children.add(buttonRemove);
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

void editTodos(int id) {
  print('edit function');
  Todo? todo = todoList.elementAt(id);
  todoInput.value = todo?.text;
  date.value = todo?.dueDate;
  priority.value = todo?.priority;
  addTodo;
  todoList.removeAt(id);
  updateTodos();
}
