import 'package:angular/angular.dart';
import 'package:dart_web/src/components/app_component/app_component.template.dart' as ng;
import 'package:firebase/firebase.dart'; // template??? 

void main() {
  initializeApp(
    // Firebase initialization data (apiKey, authDomain, databaseUrl, ...)
  );
  
  runApp(ng.AppComponentNgFactory);
}
