import 'package:flutter/material.dart';
import 'package:todo_list_05flu/add/add_view_model.dart';
import 'package:todo_list_05flu/database/app_database.dart';
import 'package:todo_list_05flu/database/app_repository.dart';
import 'package:todo_list_05flu/database/todo.dart';

class AddPage extends StatefulWidget {
  final AppDatabase database;
  const AddPage({required this.database});

  @override
  State<StatefulWidget> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
TextEditingController _controller = TextEditingController();
late final AddViewModel vm;
late final AppDatabase db;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Add Page - initState");
    db = widget.database;
    final repo = AppRepositoryImpl(db: db);
    vm = AddViewModel(repo: repo);
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

  Future <void> _saveTodo() async {
    String title = _controller.text;
    try {
      if (title.length < 3) {
      throw(TodoTitleException("title symbols can't be lower than 3"));
      } 
      final todo = Todo(id: 5, title: title, isDone: false, createdAt: DateTime.now().toString());
      vm.addTodo(todo);
      showAppSnackBar(context, text: "Задача успешно сохранена!", backgroundColor: Colors.green, icon: Icons.check_circle);
      Future.delayed(Duration(seconds: 3));
      Navigator.pop(context);
    } catch (e) {
      //print(e.toString());
      showAppSnackBar(context, text: "Название не должно быть менее 3 символов", backgroundColor: Colors.red);
    }
  }

  Future <void> showAppSnackBar(
  BuildContext context, {
  required String text,
  Color? backgroundColor,
  IconData? icon,
  VoidCallback? onRetry,
  String retryText = "Повторить",
}) async {
  final messenger = ScaffoldMessenger.of(context);

  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(
    SnackBar(
      content: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
          ],
          Expanded(child: Text(text)),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 100),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      duration: const Duration(seconds: 2),
      action: onRetry == null
          ? null
          : SnackBarAction(
              label: retryText,
              onPressed: onRetry,
              textColor: Colors.white,
            ),
    ),
  );
  }
}

class TodoTitleException implements Exception {
  final String message;

  TodoTitleException(this.message);

  @override
  String toString() {
    return 'TodoTitleException: $message';
  }
}