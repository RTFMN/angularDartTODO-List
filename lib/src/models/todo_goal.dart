class TodoGoal {
  String id;
  String goal;
  bool done;
  bool edit;

  TodoGoal({
    this.id,
    this.goal = '', 
    this.done = false, 
    this.edit = false
  });

  TodoGoal.fromMap(Map todo)
      : this(
          id: todo['id'],
          goal: todo['goal'],
          done: todo['done'],
          edit: todo['edit'],
        );

  asMap() => {
        'goal': goal,
        'done': done,
        'edit': edit,
      };
}