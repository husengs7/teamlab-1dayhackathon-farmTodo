import 'package:flutter/material.dart';

class AddScreenMiddleLayerWidget extends StatelessWidget {
  final Widget child;
  
  const AddScreenMiddleLayerWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final layerHeight = screenHeight * 0.8; // 画面高さの80%（フォーム用に大きく）
    
    return Stack(
      children: [
        // タスク追加画面用の中間レイヤー（中央に1つ）
        Positioned(
          top: screenHeight * 0.1, // 画面上部から10%の位置
          left: 16,
          right: 16,
          height: layerHeight,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                // 🌟 ここにタスク追加画面用の中間レイヤー画像のパスを指定してください 🌟
                image: AssetImage('assets/images/add_screen_middle_layer.png'),
                fit: BoxFit.contain, // 画像全体を表示
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
        
        // 実際のコンテンツ
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: child,
        ),
      ],
    );
  }
}