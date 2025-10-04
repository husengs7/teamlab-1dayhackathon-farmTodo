import 'package:flutter/material.dart';

class AddScreenBackgroundWidget extends StatelessWidget {
  final Widget child;
  
  const AddScreenBackgroundWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          // 🌟 ここにタスク追加画面用の背景画像のパスを指定してください 🌟
          // assets/images/ フォルダに画像を配置し、
          // 以下のファイル名を変更してください
          image: AssetImage('assets/images/add.png'),
          fit: BoxFit.cover, // 画面全体を埋める
          repeat: ImageRepeat.repeatY, // 縦方向にリピート
        ),
      ),
      child: child,
    );
  }
}