import 'dart:convert';

class Toptom {
  Toptom({
    required this.task,
    this.dateTime,
  });
  final String task;
  final DateTime? dateTime;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'task': task,
      'dateTime': dateTime?.millisecondsSinceEpoch,
    };
  }

  factory Toptom.fromJsom(Map<String, dynamic> map) {
    return Toptom(
      task: map['task'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }
}
