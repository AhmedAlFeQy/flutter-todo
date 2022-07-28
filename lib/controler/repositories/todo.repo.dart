import 'package:sqflite/sqlite_api.dart';
import 'package:todo/model/todo.model.dart';

class TodoRepository {
  
  late Database database;
  List<Map> tasks = [];
  List<Map> tasksComplete = [];
  List<Map> tasksUnComplete = [];
  List<Map> tasksFavorite = [];
  List<Map> tasksSelectedDate = [];
  String selectedDate = '';
  
  
  
  Future<List<Todo>> getTodos({
    required Database database,
  }) async {
    final datas = await database.rawQuery('SELECT * FROM todo');
    List<Todo> todos = [];
    for (var item in datas) {
      todos.add(Todo(
        item['id'] as int,
        item['title'] as String,
        item['startTime'] as String,
        item['endTime'] as String,
        item['remindTime'] as String,
        item['repeatTime'] as String,
        item['color'] as String,
        item['isCompleted'] as int,
        item['isFavorite '] as int,
        item['date'] as String,
      ));
    }
    return todos;
  }

  Future<dynamic> addTodo({
    required Database database,
    required String title,
    required String date,
    required String startTime,
    required String endTime,
    required String color,
    required String remindTime,
    required String repeatTime,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO todo (title,date,start_time,end_time,remind,repeat,isCompleted,isFavorite,color) VALUES($title,$date,$startTime,$endTime,$remindTime,$repeatTime,${0},${0},$color)");
    });
  }

  Future<dynamic> removeTodo({
    required Database database,
    required int id,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM todo where id = $id');
    });
    
  }
}
