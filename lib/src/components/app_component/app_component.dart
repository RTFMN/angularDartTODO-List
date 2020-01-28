import 'package:angular/angular.dart';
import 'package:dart_web/src/components/footer_component/footer_component.dart';
import 'package:dart_web/src/components/header_component/header_component.dart';
import 'package:dart_web/src/components/new_todo_component/new_todo_component.dart';
import 'package:dart_web/src/components/todo_list_component/todo_list_component.dart';
import 'package:dart_web/src/services/todo-list_service.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [HeaderComponent, NewTodoComponent, TodoListComponent, FooterComponent],
  providers: [ClassProvider(TodoListService)]
)
class AppComponent {
  
}
