import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_screen_test/models/course_chapter.dart';
import 'package:test_screen_test/widgets/lesson.dart';

import '../models/lesson.dart';

class CourseChapterItem extends StatefulWidget {
  CourseChapterItem(
      {Key? key, required this.chapter, required this.deleteChapter})
      : super(key: key);
  final CourseChapter chapter;
  final Function deleteChapter;

  @override
  State<CourseChapterItem> createState() => _CourseChapterItemState();
}

class _CourseChapterItemState extends State<CourseChapterItem> {
  final List<LessonItem> lessons = [];

  @override
  void initState() {
    // TODO: implement initState
    for (Lesson lesson in widget.chapter.lessons) {
      lessons.add(LessonItem(lesson: lesson));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.chapter.lessonNumber * 110 + 72,
      child: Column(children: [
        ListTile(
          title: Text(
            'Chương ' +
                widget.chapter.index.toString() +
                ': ' +
                widget.chapter.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: SizedBox(
            width: 110,
            child: Row(children: [
              Text(widget.chapter.lessonNumber.toString() + ' bài học'),
              SizedBox(
                width: 16,
              ),
              Text(widget.chapter.diskAmount)
            ]),
          ),
          trailing: IconButton(
              onPressed: () => showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (_) => Ink(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24))),
                        height: 250,
                        child: Column(children: [
                          SizedBox(
                            height: 52,
                            child: Row(children: [
                              IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const ImageIcon(
                                    AssetImage('assets/icons/X.png'),
                                  )),
                              Expanded(
                                child: Container(
                                  child: const Text(
                                    'Chọn hành động',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          const Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Divider(),
                          ),
                          SizedBox(
                            height: 57,
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: ListTile(title: Text('Đi tới khóa học')),
                            ),
                          ),
                          const Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Divider(),
                          ),
                          SizedBox(
                            height: 57,
                            child: InkWell(
                              onTap: () => showCupertinoDialog(
                                  context: context,
                                  builder: (_) => CupertinoAlertDialog(
                                        title: Text('Xóa chương'),
                                        content: Text(
                                            'Bạn có chắc chắn muốn xóa "Chương ${widget.chapter.index.toString()}: ${widget.chapter.name}"?'),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('Hủy bỏ')),
                                          TextButton(
                                              onPressed: () {
                                                widget.deleteChapter(
                                                    widget.chapter.index);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Xác nhận')),
                                        ],
                                      )),
                              child: ListTile(
                                  title: Text(
                                'Xóa chương',
                                style: TextStyle(color: Colors.red),
                              )),
                            ),
                          ),
                        ]),
                      )),
              icon: const ImageIcon(
                  AssetImage('assets/icons/DotsThreeVertical.png'))),
        ),
        Expanded(
            child: Column(
          children: lessons,
        ))
      ]),
    );
  }
}
