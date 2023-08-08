import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo List',
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);
  @override
  TodoListScreenState createState() => TodoListScreenState();
}

class TodoListScreenState extends State<TodoListScreen> {
  TextEditingController textEditingController = TextEditingController();
  List<String> tasks = [];

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
    });
    textEditingController.clear();
  }

  void removeTask(int index) {
    setState(() {
      textEditingController.text = tasks[index];
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              hintText: 'Enter a task',
              contentPadding: EdgeInsets.all(10.0),
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                _addTask(value);
              }
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]),
                  onTap: () {
                    removeTask(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
