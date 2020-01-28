import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:dart_web/src/models/todo_goal.dart';
import 'package:dart_web/src/services/todo-list_service.dart';

@Component (
  selector: 'todo-list',
  templateUrl: './todo_list_component.html',
  styleUrls: ['./todo_list_component.css'],
  directives: [coreDirectives, formDirectives],
)

class TodoListComponent implements OnInit{
  TodoGoal editedTodo;

  List<TodoGoal> todos = []; 
  final TodoListService _todoListService;
  TodoListComponent(this._todoListService);
  
  // Future ngOnInit() async {
  //   todos = await _todoListService.getAll();
  // }

  Future _getTodos() async {
    todos = await _todoListService.getAll();
  }

  void ngOnInit() {
    _getTodos();
  }

  editTodo(int index){
    todos[index].edit = true;
    editedTodo = TodoGoal(goal: todos[index].goal, done: todos[index].done, edit: todos[index].edit );
  }

  updateTodo(int index){
    todos[index].goal = editedTodo.goal;
    todos[index].done = editedTodo.done;
    todos[index].edit = false;
  }

  cancelEdit(int index){
    todos[index].edit = false;
  }

  removeTodo(int index){
    todos.removeAt(index);
  }
}