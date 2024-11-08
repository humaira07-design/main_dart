import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> tasks = [];
  final TextEditingController taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tasks = prefs.getStringList('tasks') ?? [];
    });
  }

  Future<void> saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', tasks);
  }

  void addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add(taskController.text);
        taskController.clear();
        saveTasks();
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      saveTasks();
    });
  }

  void markComplete(int index) {
    setState(() {
      tasks[index] += ' (Completed)';
      saveTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: 'Add a new task',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addTask,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () => markComplete(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteTask(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
