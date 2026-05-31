//модель данных для задачи
class Todo {
  final int id;
   String title;
   bool isDone;
  final String createdAt;

  Todo(
    {
    required this.id, 
    required this.title, 
    required this.isDone, 
    required this.createdAt
    });  
}

// class Note {
//   final int id;
//    String title;
//    String description;
//   final String createdAt;
// }