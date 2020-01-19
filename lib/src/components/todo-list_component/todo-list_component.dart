import 'dart:convert';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:dart_web/src/services/todo-list_service.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo-list_component.css'],
  templateUrl: 'todo-list_component.html',
  directives: [coreDirectives],
  providers: [ClassProvider(TodoListService)]
)
class ToDoListComponent {
  final TodoListService todoListService;

  List todos = [];

  ToDoListComponent(this.todoListService);

  Future ngOnInit() async {
    todos = await todoListService.getTodoList();
    print('todos: $todos');
  }

  remove(int index) => todos.removeAt(index);

  addNewGoal(String goal){
    var jsonFile = json.decode(window.localStorage['goals']);
    jsonFile.add({"goal":goal,"active":"active"});
    (querySelector('#newGoal') as InputElement).value='';
    window.localStorage['goals'] = json.encode(jsonFile);
  }
}
