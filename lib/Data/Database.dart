import 'package:hive/hive.dart';

class TodoDatabase {
  List tasks = [];

  final _mybox = Hive.box('mybox');

  void creatinitdata() {
    tasks = [
      ["default tasks", true],
      ["do code", true]
    ];
  }

  void loaddata() {
    tasks = _mybox.get("tasks");
  }

  void updatedata(){
    _mybox.put("tasks", tasks);
  }
}
