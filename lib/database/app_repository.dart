
import 'package:todo_list_05flu/database/app_database.dart';
import 'package:todo_list_05flu/database/todo.dart';

abstract class AppRepository {
  //описание методов
  List<Todo> getTodoList();

  void addTodo(Todo todo);
}

//реализация методов
class AppRepositoryImpl extends AppRepository {
  final AppDatabase db;

  AppRepositoryImpl({required this.db});

  @override
  List<Todo> getTodoList() => db.getTodoList();

  @override
  void addTodo(Todo todo) {
    db.addTodo(todo);
  }

  
}