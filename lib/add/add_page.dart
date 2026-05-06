import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage();

  @override
  State<StatefulWidget> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
TextEditingController _controller = TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Add Page - initState");
  }

  @override
  Widget build(BuildContext context) {
    print("AddPage - build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Новая задача"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: 
                InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Введите название задачи")
            ),
            controller: _controller,
            ),
            TextButton(onPressed: _saveTodo, child: Text("Сохранить"))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Add Page - dispose");
  }

  void _saveTodo() {
    Navigator.pop(context, _controller.text);
  }
}