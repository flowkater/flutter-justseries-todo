import 'dart:io';
import 'package:drift/native.dart';
import 'package:justtodo/domain/todo.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Todos,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Stream<List<Todo>> watchAllTodos() => select(todos).watch();

  Future<int> insertTodo(TodosCompanion todo) => into(todos).insert(todo);

  Future<int> updateTodoById(Todo todo) =>
      (update(todos)..where((t) => t.id.equals(todo.id))).write(todo);

  Future<int> deleteTodoById(int id) =>
      (delete(todos)..where((t) => t.id.equals(id))).go();

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'local_database.db'));
    return NativeDatabase(file);
  });
}
