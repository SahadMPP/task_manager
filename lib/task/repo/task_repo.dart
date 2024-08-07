import 'package:sqflite/sqflite.dart';
import 'package:task_manager/task/repo/task_model.dart';

abstract class TaskRepo {
  Future<void> initialzeDataBase();
  Future<void> addTask(TaskModel value);
  Future<List<TaskModel>> getAllTask();
  Future<void> updatetask(TaskModel value);
  Future<void> deleteTask(int id);
}

class TaskRepoImpli extends TaskRepo {
  late Database db;

  @override
  Future<void> initialzeDataBase() async {
    db = await openDatabase(
      "task_db",
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE task (id INTEGER PRIMARY KEY, title TEXT, isCompleted INTEGER DEFAULT 0)');
      },
    );
  }

  @override
  Future<void> addTask(TaskModel value) async {
    await db.rawInsert('INSERT INTO task(title) VALUES(?)', [value.title]);
  }

  @override
  Future<void> updatetask(TaskModel value) async {
   await db.rawUpdate("UPDATE task SET title = ? WHERE id = ?", [value.title, value.id]);
  }

  @override
  Future<void> deleteTask(int id) async {
    await db.rawDelete('DELETE FROM task WHERE id = ?', [id]);
  }

  @override
  Future<List<TaskModel>> getAllTask() async {
    List<TaskModel> list = [];

    final value = await db.rawQuery("SELECT * FROM task");
    for (var map in value) {
      final password = TaskModel.fromMap(map);
      list.add(password);
    }
    return list;
  }
}
