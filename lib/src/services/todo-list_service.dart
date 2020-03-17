import 'dart:async';
import 'package:dart_web/src/models/todo_goal.dart';
import 'package:firebase/firebase.dart';

class TodoListService{
  final List<TodoGoal> todos = [];
  Database db;
  DatabaseReference ref;

  TodoListService()
    :db = database(),
    ref = database().ref("todos");

  Future<List<TodoGoal>> getAll() async {
    final List<TodoGoal> todos = [];
    final queryEvent = await ref.once('value');
    final DataSnapshot snapshot = queryEvent.snapshot;
    final bmData = snapshot.val();

    bmData.forEach((key, val) {
      var details = val as Map<String, dynamic>;
      details['id'] = key;
      if (details['id']!='example'){
        todos.add(TodoGoal.fromMap(details));
      }
    });
    
    return todos;
  }

  Future changeState(TodoGoal todo) async {
    return await ref.child(todo.id).set(todo.asMap());
  }

  Future editTodo(TodoGoal todo) async {
    return await ref.child(todo.id).set(todo.asMap());
  }

  Future removeTodo(TodoGoal todo) async {
    return await ref.child(todo.id).remove();
  }

  Future addTodo(TodoGoal todo) async {
    var res = await ref.push(todo.asMap());
    return res.key;
  }
}