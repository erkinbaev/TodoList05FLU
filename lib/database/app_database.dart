
import 'package:todo_list_05flu/database/todo.dart';
import 'package:hive/hive.dart';

class AppDatabase {
  //Создаем первый box(полка внешняя)
  final Box box = Hive.box('todoBox');

  List<Todo> _todoList = [];

  AppDatabase() {
    loadTodos();
  }

//hive -> dart
  void loadTodos() {
    final data = box.get('todos', defaultValue: []);
    //map - цикл, который возвращает новые список
    _todoList = List<Map>.from(data).map( (e) {
      //в hive все данные лежат по ключу и значению, поэтому достаем и указываем ключи
      return Todo(
        id: e['id'], 
        title: e['title'], 
        isDone: e['isDone'], 
        createdAt: e['createdAt'],
        );
    }).toList();
  }

  //dart -> hive
  void saveTodos() {
    //map - цикл, который возвращает новые список
    final data = _todoList.map((todo) {
      return {
        "id": todo.id,
        "title": todo.title,
        "isDone": todo.isDone,
        "createdAt": todo.createdAt
      };
    }).toList();

    box.put('todos', data);
  }
    //CRUD operations

    //CREATE
    void addTodo(Todo todo) {
      _todoList.insert(0, todo);
      saveTodos();
    }

    //READ
    List<Todo> getTodoList() {
      return _todoList;
    }

    //UPDATE
    void updateTodo(int index, String title) {
      _todoList[index].title = title;
      saveTodos();
    }

    //DELETE
    void deleteTodo(int index) {
      _todoList.removeAt(index);
      saveTodos();
    }

    //Для чекбокса залачи
    void updateTodoState(int index, bool isDone) {
      _todoList[index].isDone = isDone;
      saveTodos();
    }
}