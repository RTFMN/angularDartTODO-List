class TodoGoal {
  String goal;
  bool done;
  bool edit;

  TodoGoal({
    this.goal = '', 
    this.done = false, 
    this.edit = false
  });

  TodoGoal.fromMap(Map todo)
      : this(
          goal: todo['goal'],
          done: todo['done'],
          edit: todo['edit'],
        );
}