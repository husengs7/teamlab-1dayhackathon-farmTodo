import 'package:flutter/material.dart';

class MiddleLayerWidget extends StatelessWidget {
  final Widget child;
  
  const MiddleLayerWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 中間レイヤー画像を背景の2枚それぞれの上部に配置
        Positioned.fill(
          child: Column(
            children: [
              // 1枚目の背景画像の上部に中間レイヤー
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    height: MediaQuery.of(context).size.height * 0.15, // 画面高さの15%
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        // 🌟 ここに中間レイヤー画像のパスを指定してください 🌟
                        image: AssetImage('assets/images/farm.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // 2枚目の背景画像の上部に中間レイヤー
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    height: MediaQuery.of(context).size.height * 0.15, // 画面高さの15%
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        // 🌟 ここに中間レイヤー画像のパスを指定してください 🌟
                        image: AssetImage('assets/images/farm.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // 実際のコンテンツ
        Padding(
          padding: const EdgeInsets.all(16.0), // 左右上下に余白を追加
          child: child,
        ),
      ],
    );
  }
}