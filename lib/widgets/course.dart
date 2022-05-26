import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_screen_test/models/course.dart';
import 'package:test_screen_test/widgets/course_chapter.dart';

class CourseDownload extends StatefulWidget {
  const CourseDownload({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  State<CourseDownload> createState() => _CourseDownloadState();
}

class _CourseDownloadState extends State<CourseDownload> {
  void deleteChapter(int index) {
    setState(() {
      for (int i = 0; i < widget.course.chapters.length; i++) {
        if (widget.course.chapters[i].index == index) {
          widget.course.chapters.removeAt(i);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: widget.course.chapters.length,
        itemBuilder: (context, index) => CourseChapterItem(
          chapter: widget.course.chapters[index],
          deleteChapter: deleteChapter,
        ),
      ),
    );
  }
}
