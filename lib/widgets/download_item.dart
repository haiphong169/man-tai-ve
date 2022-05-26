import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_screen_test/models/course.dart';
import 'package:test_screen_test/models/course_chapter.dart';
import 'package:test_screen_test/screens/course_download_screen.dart';
import 'package:test_screen_test/course_dummy_data.dart';

class DownloadItem extends StatefulWidget {
  DownloadItem(
      {Key? key,
      required this.image,
      required this.name,
      required this.educator,
      required this.size,
      required this.handleLongPress,
      required this.isPressed,
      required this.isSelected,
      required this.handleSelected,
      required this.index,
      required this.onDelete})
      : super(key: key);
  final Image image;
  final String name;
  final String educator;
  final String size;
  final VoidCallback handleLongPress;
  final Function handleSelected;
  final int index;
  final Function onDelete;
  bool isPressed;
  bool isSelected;

  @override
  State<DownloadItem> createState() => _DownloadItemState();
}

class _DownloadItemState extends State<DownloadItem> {
  DummyData dummy = DummyData();
  late List<CourseChapter> chapters = dummy.chapters;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.handleLongPress,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CourseDownloadScreen(
                    course: Course(name: widget.name, chapters: chapters),
                  )),
        );
      },
      child: Container(
        color:
            widget.isSelected ? Color.fromRGBO(242, 249, 255, 1) : Colors.white,
        width: double.infinity,
        height: 107,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                leading: Container(
                  child: widget.isPressed
                      ? SizedBox(
                          width: 120,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: widget.isSelected,
                                  shape: CircleBorder(),
                                  onChanged: (value) => setState(() {
                                        widget.isSelected = value!;
                                        widget.handleSelected(
                                            value, widget.index);
                                      })),
                              widget.image
                            ],
                          ),
                        )
                      : widget.image,
                  // margin:
                  //     const EdgeInsets.only(left: 16, top: 16, bottom: 26, right: 16),
                ),
                title: Text(
                  widget.name,
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Row(children: [
                  ImageIcon(AssetImage('assets/icons/User.png')),
                  Text(widget.educator),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(widget.size)
                ]),
                trailing: widget.isPressed
                    ? null
                    : Container(
                        child: IconButton(
                            color: Colors.red,
                            onPressed: () {
                              showCupertinoDialog(
                                  context: context,
                                  builder: (_) => CupertinoAlertDialog(
                                        title: Text('Xóa khóa học'),
                                        content: Text(
                                            'Bạn có chắc chắn muốn xóa ${widget.name}?'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Hủy bỏ')),
                                          TextButton(
                                              onPressed: () {
                                                widget.onDelete(widget.index);
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Xác nhận')),
                                        ],
                                      ));
                            },
                            icon: ImageIcon(
                                AssetImage('assets/icons/Trash.png'))),
                      ),
              ),
              const Divider(
                indent: 16,
              )
            ]),
      ),
    );
  }
}
