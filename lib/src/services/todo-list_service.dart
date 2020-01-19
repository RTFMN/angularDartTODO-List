import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:angular/core.dart';

@Injectable()
class TodoListService{
  List todos = json.decode(window.localStorage['goals']);

  Future<List> getTodoList() async => todos;
}
