import 'package:flutter/material.dart';

/// はい/いいえ が選択できるバージョン
Future jobeeConfilmDialog(
  context, {
  String? title,
  required String content,
  required onApproved,
  String? imagePath,
}) async {
  showDialog(
      context: context,
      // barrierDismissibleのbool値をtrueにすると、
      // ダイアログの外側を押した際にダイアログが出る前の画面に戻れるようになります。
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            // デバイスに応じて横幅(width)は調整してください。
            width: 375.0,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 35, 35, 36), width: 3),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.min があることで、
              // Columnの子要素の縦幅に合わせて表示できます。
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (title != null && title.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                if (imagePath != null && imagePath.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                  child: CircleAvatar(
                    backgroundImage:AssetImage(imagePath),
                    radius: 120.0,
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                  child: Text(
                    content,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                        shadowColor: Colors.grey,
                        // elevation で影の長さを指定
                        elevation: 5,
                        // primary でボタンの背景色を指定
                        backgroundColor: Colors.black87,
                        // onPrimary でボタンないの文字の色を指定
                        foregroundColor : Colors.white,
                        // shape: const StadiumBorder() でボタンのサイドがまるくなります。
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                        child: Text('いいえ'),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.grey,
                        elevation: 5,
                        backgroundColor: Colors.blueAccent,
                        onPrimary: Colors.white,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: onApproved,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                        child: Text('はい'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        );
      });
}