import 'dart:html';

void main() {
  List<String> Todo = [];
  var input = (querySelector('#todo') as InputElement);
  input.onKeyPress.listen((event) {
    if (event.key == 'Enter') {
      print('Enter pressed');
      print(input.value);
      Todo.add('hi');
      print('Todo added $Todo');
    }
  });
}
