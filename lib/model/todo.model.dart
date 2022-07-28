class Todo {
  final int id;
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final String remindTime;
  final String repeatTime;
  final String color;
  final int isCompleted;
  final int isFavorite;

  Todo(
      this.id,
      this.title,
      this.startTime,
      this.endTime,
      this.remindTime,
      this.repeatTime,
      this.color,
      this.isCompleted,
      this.isFavorite,
      this.date);
}
