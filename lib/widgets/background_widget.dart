import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  
  const BackgroundWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          // 🌟 ここに背景画像のパスを指定してください 🌟
          // assets/images/ フォルダに 1024x1024 の画像を配置し、
          // 以下のファイル名を変更してください
          image: AssetImage('assets/images/glass.png'),
          fit: BoxFit.cover, // 画像を縦に2つ並べて画面全体を埋める
          repeat: ImageRepeat.repeatY, // 縦方向にリピート
        ),
      ),
      child: child,
    );
  }
}