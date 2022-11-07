import '../main.dart';
import 'updateTodo.dart';

dynamic sortList(String value, List list) {
  print('sorting engaged by $value');

  if (value.compareTo("name") == 0) {
    print('sorting by name');

    return list.sort((a, b) {
      String x = a!.text!.toLowerCase();
      String y = b!.text!.toLowerCase();
      if (x.compareTo(y) < 0) return -1;
      if (x.compareTo(y) > 0) return 1;
      return 0;
    });
  } else if (value.compareTo("priority") == 0) {
    print('sorting by priority');
    return list.sort((a, b) => b!.pt - a!.pt);
  } else {
    print('parameter unknown');
    print(value);
  }
}
