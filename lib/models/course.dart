import 'package:test_screen_test/models/course_chapter.dart';

// khoa hoc

class Course {
  const Course({required this.name, required this.chapters});

  final String name;
  final List<CourseChapter> chapters;
}
