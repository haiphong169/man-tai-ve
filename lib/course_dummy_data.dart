import 'package:test_screen_test/models/course_chapter.dart';
import 'package:test_screen_test/models/lesson.dart';

class DummyData {
  final List<Lesson> lessons = [
    Lesson(
        index: 1,
        type: 'Video',
        duration: 10,
        hasDownloaded: true,
        name: 'Role and function of network component'),
    Lesson(
        index: 2,
        type: 'Audio',
        duration: 10,
        hasDownloaded: true,
        name: 'Role and function of network component'),
    Lesson(
        index: 3,
        type: 'Đọc tài liệu',
        duration: 10,
        hasDownloaded: false,
        name: 'Role and function of network component'),
    Lesson(
        index: 4,
        type: 'Đề thi',
        duration: 10,
        hasDownloaded: false,
        name: 'Role and function of network component'),
    Lesson(
        index: 5,
        type: 'Quiz',
        duration: 10,
        hasDownloaded: false,
        name: 'Role and function of network component'),
    Lesson(
        index: 6,
        type: 'Khảo sát',
        duration: 10,
        hasDownloaded: false,
        name: 'Role and function of network component'),
  ];

  late List<CourseChapter> chapters = [
    CourseChapter(
        lessonNumber: 6,
        diskAmount: '100MB',
        name: 'Network Fundamentals',
        index: 1,
        lessons: lessons),
    CourseChapter(
        lessonNumber: 6,
        diskAmount: '100MB',
        name: 'Network Fundamentals',
        index: 2,
        lessons: lessons),
    CourseChapter(
        lessonNumber: 6,
        diskAmount: '100MB',
        name: 'Network Fundamentals',
        index: 3,
        lessons: lessons),
  ];
}
