import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  SearchBar(
      {Key? key,
      required this.controller,
      required this.handleFocus,
      required this.isFocused,
      required this.removeFocus,
      required this.updateSearchResults,
      required this.clearText})
      : super(key: key);
  final TextEditingController controller;
  final VoidCallback handleFocus;
  final VoidCallback removeFocus;
  final Function updateSearchResults;
  final VoidCallback clearText;
  bool isFocused;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool editting = true;

  @override
  Widget build(BuildContext context) {
    if (widget.isFocused) {
      return Container(
        margin: const EdgeInsets.only(top: 32, left: 16, right: 16),
        child: Row(children: [
          IconButton(
              onPressed: () {
                widget.removeFocus();
                widget.controller.clear();
                editting = true;
              },
              icon: ImageIcon(AssetImage('assets/icons/CaretLeft.png'))),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 0),
                padding: const EdgeInsets.only(left: 16),
                decoration: editting
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: Colors.black))
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(244, 243, 244, 1)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: widget.controller,
                        onEditingComplete: () => setState(() {
                          editting = false;
                          FocusScope.of(context).unfocus();
                        }),
                        autofocus: true,
                        onChanged: (value) => widget.updateSearchResults(value),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nhập tên khóa học'),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          widget.controller.clear();
                          widget.clearText();
                        },
                        icon: ImageIcon(AssetImage('assets/icons/X.png')))
                  ],
                )),
          ),
        ]),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
            color: Color.fromRGBO(244, 243, 244, 1),
            borderRadius: BorderRadius.circular(8)),
        child: Row(children: [
          Container(
            width: 290,
            child: TextField(
              onTap: widget.handleFocus,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Nhập tên khóa học'),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage('assets/icons/MagnifyingGlass.png')))
        ]),
      );
    }
  }
}
