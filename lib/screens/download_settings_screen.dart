import 'package:flutter/material.dart';

class DownloadSettingsScreen extends StatefulWidget {
  const DownloadSettingsScreen({Key? key}) : super(key: key);

  @override
  State<DownloadSettingsScreen> createState() => _DownloadSettingsScreenState();
}

class _DownloadSettingsScreenState extends State<DownloadSettingsScreen> {
  bool onlyWifi = false;
  bool downloadToSDCard = false;
  String downloadQuality = '720p';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const ImageIcon(
            AssetImage('assets/icons/CaretLeft.png'),
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Tùy chỉnh tải xuống',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: Container(
        height: 250,
        child: Column(
          children: [
            Container(
              height: 80,
              child: ListTile(
                title: Text(
                  'Chất lượng tải xuống video',
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(244, 243, 244, 1),
                      borderRadius: BorderRadius.circular(8)),
                  width: 95,
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        downloadQuality,
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: ImageIcon(
                            AssetImage('assets/icons/CaretDown.png'),
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Divider(),
            ),
            Container(
              height: 64,
              child: ListTile(
                title: Text('Chỉ tải xuống qua Wi-Fi'),
                trailing: Switch(
                  value: onlyWifi,
                  onChanged: (value) => setState(() {
                    onlyWifi = value;
                  }),
                ),
              ),
            ),
            ListTile(
              title: Text('Tải xuống thẻ SD'),
              trailing: Switch(
                value: downloadToSDCard,
                onChanged: (value) => setState(() {
                  downloadToSDCard = value;
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
