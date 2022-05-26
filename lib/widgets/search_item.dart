import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  SearchItem(
      {Key? key,
      required this.image,
      required this.name,
      required this.keyword})
      : super(key: key);
  final Image image;
  final String name;
  String keyword;

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    String matchedLetters = widget.name.substring(0, widget.keyword.length);
    String unmatchedLetters =
        widget.name.substring(matchedLetters.length, widget.name.length);

    return InkWell(
      onTap: () {},
      child: Column(children: [
        ListTile(
          leading: Container(child: widget.image),
          title: RichText(
            text:
                TextSpan(style: DefaultTextStyle.of(context).style, children: [
              TextSpan(
                  text: matchedLetters, style: TextStyle(color: Colors.blue)),
              TextSpan(text: unmatchedLetters)
            ]),
          ),
        ),
        const Divider()
      ]),
    );
  }
}
