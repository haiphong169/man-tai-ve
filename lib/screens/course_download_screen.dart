import 'package:flutter/material.dart';
import 'package:test_screen_test/models/course.dart';
import 'package:test_screen_test/widgets/course.dart';

class CourseDownloadScreen extends StatelessWidget {
  CourseDownloadScreen({Key? key, required this.course}) : super(key: key);

  Course course;

// man tai ve ben trong

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        leading: IconButton(
          icon: const ImageIcon(
            AssetImage('assets/icons/CaretLeft.png'),
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          course.name,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: CourseDownload(
        course: course,
      ),
    );
  }
}
