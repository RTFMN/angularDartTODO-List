import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:dart_web/src/models/todo_goal.dart';
import 'package:dart_web/src/services/todo-list_service.dart';

@Component (
  selector: 'new-todo',
  templateUrl: './new_todo_component.html',
  styleUrls: ['./new_todo_component.css'],
  directives: [coreDirectives, formDirectives],
  providers: [ClassProvider(TodoListService)],
)

class NewTodoComponent implements OnInit{
  List<TodoGoal> todos;
  String placeholder = 'Oh, do you really need it?!';
  TodoGoal newGoal = TodoGoal();

  final TodoListService _todoListService;
  NewTodoComponent(this._todoListService);

  Future _getTodos() async {
    todos = await _todoListService.getAll();
  }

  @override
  void ngOnInit() {
    _getTodos();
  }

  void addTodo(){
    if (newGoal.goal.isNotEmpty){
      _getTodos();
      TodoGoal newTodo = TodoGoal(goal: newGoal.goal, done: newGoal.done, edit: newGoal.edit);
      todos.add(newTodo);
      newGoal = TodoGoal();
    }
  }
}