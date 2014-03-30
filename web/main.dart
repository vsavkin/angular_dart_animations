library angular_animations;

import 'package:angular/angular.dart';
import 'package:angular/animate/module.dart';


class Task {
  String description;
  bool done = false;

  Task(this.description);
}



@NgController(
  selector: '[todo-ctrl]',
  publishAs: 'ctrl'
)
class TodoCtrl {
  String newTask;

  final tasks = [
    new Task("Learn about Angular.Dart animations!"),
    new Task("Take a nap!")
  ];

  addNew(){
    tasks.add(new Task(newTask));
    newTask = "";
  }

  removeLast() => tasks.removeLast();
}



class TodoModule extends Module {
  TodoModule(){
    type(TodoCtrl);
    install(new NgAnimateModule());
  }
}



main(){
  ngBootstrap(module: new TodoModule());
}