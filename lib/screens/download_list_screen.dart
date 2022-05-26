// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_screen_test/screens/download_settings_screen.dart';
import 'package:test_screen_test/widgets/search_item.dart';
import '../widgets/download_item.dart';
import '../widgets/search_bar.dart';

class ListDownloadScreen extends StatefulWidget {
  const ListDownloadScreen({Key? key}) : super(key: key);

  @override
  State<ListDownloadScreen> createState() => _ListDownloadScreenState();
}

class _ListDownloadScreenState extends State<ListDownloadScreen> {
  List<DownloadItem> items = [];
  late TextEditingController _controller;
  final list = [];
  bool isLongPressed = false;
  int numSelected = 0;
  final List<int> selectedItems = [];
  List<bool> checkboxes = [false, false, false, false];
  List<SearchItem> searchResults = [];
  bool searchBarIsFocused = false;
  String searchKeyword = '';

  void changeNumSelected(bool value, int index) {
    if (value == true) {
      numSelected++;
      selectedItems.add(index);
    } else {
      numSelected--;
      selectedItems.remove(index);
    }
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
      checkboxes.removeAt(index);
    });
  }

  void setLongPressed() {
    setState(() {
      isLongPressed = !isLongPressed;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    items = [
      DownloadItem(
        image: Image.asset('assets/icons/thumbnails/_thumbnail_1.png'),
        name: 'Khóa đào tạo quản trị mạng Cisco - CCNA v1.0',
        educator: 'Hà Đức Cường',
        size: '5MB',
        isPressed: isLongPressed,
        handleLongPress: setLongPressed,
        isSelected: checkboxes[0],
        handleSelected: changeNumSelected,
        index: 0,
        onDelete: deleteItem,
      ),
      DownloadItem(
        image: Image.asset('assets/icons/thumbnails/_thumbnail_2.png'),
        name: 'Khóa đào tạo quản trị mạng Cisco - CCNA v1.0',
        educator: 'Hà Đức Cường',
        size: '5MB',
        isPressed: isLongPressed,
        handleLongPress: setLongPressed,
        isSelected: checkboxes[1],
        handleSelected: changeNumSelected,
        index: 1,
        onDelete: deleteItem,
      ),
      DownloadItem(
        image: Image.asset('assets/icons/thumbnails/_thumbnail_3.png'),
        name: 'Khóa đào tạo quản trị mạng Cisco - CCNA v1.0',
        educator: 'Hà Đức Cường',
        size: '5MB',
        isPressed: isLongPressed,
        handleLongPress: setLongPressed,
        isSelected: checkboxes[2],
        handleSelected: changeNumSelected,
        index: 2,
        onDelete: deleteItem,
      ),
      DownloadItem(
        image: Image.asset('assets/icons/thumbnails/_thumbnail.png'),
        name: 'Khóa đào tạo quản trị mạng Cisco - CCNA v1.0',
        educator: 'Hà Đức Cường',
        size: '5MB',
        isPressed: isLongPressed,
        handleLongPress: setLongPressed,
        isSelected: checkboxes[3],
        handleSelected: changeNumSelected,
        index: 3,
        onDelete: deleteItem,
      ),
    ];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void selectAll() {
    numSelected = items.length;
    selectedItems.clear();
    for (int i = 0; i < items.length; i++) {
      selectedItems.add(i);
    }
    setState(() {
      for (int i = 0; i < checkboxes.length; i++) {
        checkboxes[i] = true;
      }
    });
  }

  void focusSearchBar() {
    setState(() {
      searchBarIsFocused = true;
    });
  }

  void exitFocusSearchBar() {
    setState(() {
      searchBarIsFocused = false;
      searchResults.clear();
      searchKeyword = '';
    });
  }

  void updateSearchResults(String value) {
    setState(() {
      searchResults.clear();
      searchKeyword = value;
    });
    if (value == '') {
      return;
    }
    for (DownloadItem item in items) {
      if (value.toLowerCase() ==
          item.name.substring(0, value.length).toLowerCase()) {
        setState(() {
          searchResults.add(SearchItem(
            image: item.image,
            name: item.name,
            keyword: searchKeyword,
          ));
        });
      }
    }
  }

  void clearText() {
    setState(() {
      searchKeyword = '';
      searchResults.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBarIsFocused
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              centerTitle: true,
              leadingWidth: 150,
              leading: isLongPressed
                  ? TextButton(
                      onPressed: selectAll,
                      child: Text(
                        'Chọn tất cả',
                        style: TextStyle(fontSize: 16),
                      ))
                  : null,
              title: Text(
                'Danh sách tải về',
                style: TextStyle(fontSize: 16),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DownloadSettingsScreen()),
                      );
                    },
                    icon: ImageIcon(AssetImage('assets/icons/Gear.png')))
              ],
            ),
      body: SingleChildScrollView(
        child: Container(
          height: 700,
          child: Column(children: [
            if (isLongPressed)
              SizedBox.shrink()
            else
              SearchBar(
                controller: _controller,
                handleFocus: focusSearchBar,
                isFocused: searchBarIsFocused,
                removeFocus: exitFocusSearchBar,
                updateSearchResults: updateSearchResults,
                clearText: clearText,
              ),
            if (searchBarIsFocused)
              if (searchKeyword != '' && searchResults.isEmpty)
                Expanded(
                  child: Center(
                    child: Text('Không có dữ liệu'),
                  ),
                )
              else
                Expanded(
                    child: ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          return searchResults[index];
                        }))
            else
              Expanded(
                // ignore: prefer_const_literals_to_create_immutables
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return DownloadItem(
                          image: item.image,
                          name: item.name,
                          educator: item.educator,
                          size: item.size,
                          handleLongPress: item.handleLongPress,
                          isPressed: isLongPressed,
                          isSelected: checkboxes[index],
                          handleSelected: item.handleSelected,
                          index: index,
                          onDelete: item.onDelete);
                    }),
              )
          ]),
        ),
      ),
      bottomNavigationBar: isLongPressed
          ? BottomAppBar(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 44,
                      width: 163.5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: ElevatedButton(
                        onPressed: () => setState(() {
                          isLongPressed = false;
                          for (int i = 0; i < checkboxes.length; i++) {
                            checkboxes[i] = false;
                          }
                        }),
                        child: Text(
                          'Huỷ bỏ',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(244, 243, 244, 1)),
                      ),
                    ),
                    Container(
                      height: 44,
                      width: 163.5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            showCupertinoDialog(
                                context: context,
                                builder: (_) {
                                  String title = numSelected == 1
                                      ? 'Xóa khóa học'
                                      : 'Xóa ${numSelected} khóa học';
                                  String content = numSelected == 1
                                      ? 'Bạn có chắc chắn muốn xóa ${items[selectedItems[0]].name}?'
                                      : 'Bạn có chắc chắn muốn xóa ${numSelected} khóa học?';
                                  return CupertinoAlertDialog(
                                    title: Text(title),
                                    content: Text(content),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: Text(
                                            'Hủy bỏ',
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              for (int i =
                                                      selectedItems.length - 1;
                                                  i >= 0;
                                                  i--) {
                                                items
                                                    .removeAt(selectedItems[i]);
                                              }
                                            });
                                            numSelected = 0;
                                            selectedItems.clear();
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Xác nhận',
                                          )),
                                    ],
                                  );
                                });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage('assets/icons/Trash.png'),
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Xóa',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                    ),
                  ]),
            )
          : null,
    );
  }
}
