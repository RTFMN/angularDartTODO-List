import 'package:angular/angular.dart';
import 'package:dart_web/src/components/new-todo_component/new-todo_component.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo-list_component.css'],
  templateUrl: 'todo-list_component.html',
  directives: [NewToDoComponent]
)
class ToDoListComponent {
  
}