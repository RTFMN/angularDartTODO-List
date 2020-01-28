import 'package:angular/angular.dart';

@Component(
  selector: 'header',
  styleUrls: ['header_component.css'],
  templateUrl: 'header_component.html',
)

@Injectable()
class HeaderComponent{
  String title = 'ToDo-List 2020';
}