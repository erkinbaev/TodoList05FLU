
import 'package:todo_list_05flu/database/app_repository.dart';
import 'package:todo_list_05flu/database/todo.dart';

class HomeViewModel {
  final AppRepositoryImpl repo;
  List<Todo> todoList = [];

  HomeViewModel({required this.repo});

  List<Todo> getTodoList() {
    todoList = repo.getTodoList();
    return todoList;
  }
}