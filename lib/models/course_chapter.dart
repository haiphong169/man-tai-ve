import 'package:test_screen_test/models/lesson.dart';

// 1 chuong cua khoa hoc

class CourseChapter {
  const CourseChapter(
      {required this.lessonNumber,
      required this.diskAmount,
      required this.name,
      required this.index,
      required this.lessons});

  final int lessonNumber;
  final String diskAmount;
  final String name;
  final int index;
  final List<Lesson> lessons;
}
