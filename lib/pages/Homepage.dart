import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_practice_project/Data/Database.dart';
import 'package:todo_list_practice_project/utils/CreatTasks.dart';
import 'package:todo_list_practice_project/utils/TodoTile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final _mybox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();
  
  @override
  void initState(){
    if(_mybox.get("tasks") == null){
      db.creatinitdata();
    }
    else{
      db.loaddata();
    }
    super.initState();
  }
  
  TextEditingController controller = TextEditingController();

  // Toggle completion status of a task
  void OnChanged(bool? value, int index) {
    setState(() {
      db.tasks[index][1] = !db.tasks[index][1];
    });
    db.updatedata();
  }

  // Save a new task
  void Savetask() {
    setState(() {
      db.tasks.add([controller.text, false]);
    });
    Navigator.pop(context);
    db.updatedata();
    controller.clear();
  }

  // Cancel the task creation dialog
  void Canceltask() {
    Navigator.pop(context);
    controller.clear();
  }

  // Show dialog for adding a new task
  void FloatButton() {
    showDialog(
      context: context,
      builder: (context) {
        return CreatTasks(
          OnAdd: Savetask,
          OnCancel: Canceltask,
          controller: controller,
        );
      },
    );
  }

  // Edit a task
  void editfunction(BuildContext context, int index) {
    controller.text = db.tasks[index][0]; // Pre-fill with current task name
    showDialog(
      context: context,
      builder: (context) {
        return CreatTasks(
          OnAdd: () {
            setState(() {
              db.tasks[index][0] = controller.text; // Update task name
            });
            Navigator.pop(context);
            controller.clear();
          },
          OnCancel: Canceltask,
          controller: controller,
        );
      },
    );
    db.updatedata();
  }

  // Delete a task
  void deletefunction(BuildContext context, int index) {
    setState(() {
      db.tasks.removeAt(index); // Remove task from the list
    });
    db.updatedata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.contrast),
            )
          ],
          centerTitle: true,
          title: Text(
            'T O D O  L I S T',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: ListView.builder(
          itemCount: db.tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return Todotile(
              TaskName: db.tasks[index][0],
              TaskCompleted: db.tasks[index][1],
              onChanged: (value) => OnChanged(value, index),
              editfunction: (context) => editfunction(context, index),
              deletefunction: (context) => deletefunction(context, index),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          focusColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: FloatButton,
          shape: const CircleBorder(),
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
