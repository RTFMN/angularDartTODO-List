import 'package:angular/angular.dart';
import 'package:dart_web/src/components/footer_component/footer_component.dart';
import 'package:dart_web/src/components/header_component/header_component.dart';
import 'package:dart_web/src/components/todo-list_component/todo-list_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [HeaderComponent, FooterComponent, ToDoListComponent],
)
class AppComponent {
  
}
