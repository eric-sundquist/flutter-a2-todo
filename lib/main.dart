import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> _tasks = [];

  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
    });
    _textEditingController.clear();
  }

  void _removeTask(int index) {
    setState(() {
      _textEditingController.text = _tasks[index];
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
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
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index]),
                  onTap: () {
                    _removeTask(index);
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
