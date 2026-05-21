
import 'package:todo_list_05flu/database/app_repository.dart';
import 'package:todo_list_05flu/database/todo.dart';

class AddViewModel {
  final AppRepository repo;

  AddViewModel({required this.repo});

  void addTodo(Todo todo) {
    repo.addTodo(todo);
  }

}