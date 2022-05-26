import 'package:flutter/material.dart';
import 'package:test_screen_test/models/lesson.dart';
import 'package:badges/badges.dart';

class LessonItem extends StatefulWidget {
  const LessonItem({Key? key, required this.lesson}) : super(key: key);
  final Lesson lesson;

  @override
  State<LessonItem> createState() => _LessonItemState();
}

class _LessonItemState extends State<LessonItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Column(children: [
        ListTile(
          leading: widget.lesson.hasDownloaded
              ? Badge(
                  badgeColor: Colors.green,
                  badgeContent: const Icon(
                    Icons.check_outlined,
                    color: Colors.white,
                    size: 13,
                  ),
                  child: CircleAvatar(
                    radius: 19,
                    backgroundColor: Colors.black54,
                    child: CircleAvatar(
                      child: Text(
                        widget.lesson.index.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.white,
                      radius: 18,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 19,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    child: Text(
                      widget.lesson.index.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.white,
                    radius: 18,
                  ),
                ),
          title: Text(
            widget.lesson.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Container(
            height: 44,
            width: 190,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.lesson.type),
                  Text(widget.lesson.duration.toString() + ' phút'),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue)),
                    onPressed: () {},
                    child: const Text('Tệp đính kèm'),
                  )
                ]),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage('assets/icons/Trash.png'),
                color: Colors.red,
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Divider(),
        )
      ]),
    );
  }
}
