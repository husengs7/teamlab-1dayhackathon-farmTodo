import 'package:flutter/material.dart';

class MiddleLayerWidget extends StatelessWidget {
  final Widget child;
  
  const MiddleLayerWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final layerHeight = screenHeight * 0.6; // 画面高さの60%
    
    return Stack(
      children: [
        // 1枚目の背景画像の上部に中間レイヤー
        Positioned(
          top: -100,
          left: 4,
          right: 4,
          height: layerHeight,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                // 🌟 ここに中間レイヤー画像のパスを指定してください 🌟
                image: AssetImage('assets/images/farm.png'),
                fit: BoxFit.contain, // 画像全体を表示
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
        
        // 2枚目の背景画像の上部に中間レイヤー
        Positioned(
          top: screenHeight * 0.5 - 100, // 画面の中央から上に100px移動
          left: 4,
          right: 4,
          height: layerHeight,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                // 🌟 ここに中間レイヤー画像のパスを指定してください 🌟
                image: AssetImage('assets/images/farm.png'),
                fit: BoxFit.contain, // 画像全体を表示
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
        
        // 実際のコンテンツ
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ],
    );
  }
}