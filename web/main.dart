import 'package:angular/angular.dart';
import 'dart:html';
import 'package:dart_web/src/components/app_component/app_component.template.dart' as ng; // template??? 

void main() {
  if (!window.localStorage.containsKey('goals')){
    window.localStorage['goals'] = '[]';
  }
  
  runApp(ng.AppComponentNgFactory);
}
