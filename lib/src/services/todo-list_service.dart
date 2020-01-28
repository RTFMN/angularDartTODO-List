import 'package:dart_web/src/models/mock_todo_list.dart';
import 'dart:async';
import 'package:dart_web/src/models/todo_goal.dart';

class TodoListService{
  Future<List<TodoGoal>> getAll() async => todos;
}
