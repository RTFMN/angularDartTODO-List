import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';

@Component(
  selector: 'new-todo',
  styleUrls: ['new-todo_component.css'],
  templateUrl: 'new-todo_component.html'
)
class NewToDoComponent {
  addNewGoal(goal){
    final jsonFile = json.decode(window.localStorage['goals']);
    print( 'Декодировали строку в $jsonFile' );

    jsonFile.add({"id":jsonFile.length,"goal":goal});
    print( 'Добавили $goal в $jsonFile' );

    window.localStorage['goals'] = json.encode(jsonFile);
    print( 'Записываем $jsonFile в localStorage' );

    print(window.localStorage['goals']);
  }
}