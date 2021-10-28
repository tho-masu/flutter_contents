import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
      ),
      // "pop"の引数から前の画面にデータを渡す
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("ダイアログ"),
              content: const Text("XYZABCDEFGHIJKLMN"),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: const Text('アラート', style: TextStyle(color: Colors.white)),
    );
  }
}
