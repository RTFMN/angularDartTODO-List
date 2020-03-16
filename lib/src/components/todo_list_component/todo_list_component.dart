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
  String placeholder = 'Oh, do you really need it?!';
  List<TodoGoal> todos = []; 
  TodoGoal newGoal = TodoGoal();
  TodoGoal editedTodo;
  TodoGoal changedTodo;
  bool loading = true;

  final TodoListService service;
  TodoListComponent(this.service);
  
  @override
  Future ngOnInit() async {
    todos = await service.getAll();
    loading = false;
  }

  addTodo() async {
    if (newGoal.goal.isNotEmpty){
      String newTodoId;
      
      TodoGoal newTodo = TodoGoal(goal: newGoal.goal);
      newTodoId = await service.addTodo(newTodo);
      newTodo.id = newTodoId;
      todos.add(newTodo);
      newGoal = TodoGoal();
    }
  }

  changeState(int index) async {
    todos[index].done = !todos[index].done;
    await service.changeState(todos[index]);
  }

  editTodo(int index){
    todos[index].edit = true;
    editedTodo = TodoGoal(goal: todos[index].goal);
  }

  updateTodo(int index) async {
    todos[index].goal = editedTodo.goal;
    todos[index].edit = false;
    await service.editTodo(todos[index]);
  }

  cancelEdit(int index){
    todos[index].edit = false;
  }

  removeTodo(int index) async {
    await service.removeTodo(todos[index]);
    todos.removeAt(index);
  }
}