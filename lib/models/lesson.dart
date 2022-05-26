import 'package:flutter/foundation.dart';

class Lesson {
  Lesson(
      {required this.index,
      required this.type,
      required this.duration,
      required this.hasDownloaded,
      required this.name});

  final String name;
  final int index;
  final String type;
  final int duration;
  bool hasDownloaded;
}
