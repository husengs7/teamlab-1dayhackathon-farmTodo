import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/todo.dart';

class TaskSlotCard extends StatelessWidget {
  final Todo? todo; // nullの場合は空のスロット
  final VoidCallback? onToggle;
  final int slotIndex; // スロットのインデックス（0-3）
  
  const TaskSlotCard({
    super.key,
    this.todo,
    this.onToggle,
    required this.slotIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: slotIndex >= 2 ? const Offset(0, -30) : Offset.zero, // 下の2スロットを上に30px移動
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero, // マージンを削除
        child: AspectRatio(
        aspectRatio: 1.0, // 正方形
        child: InkWell(
          onTap: todo != null ? onToggle : null,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_getImagePath()),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                if (todo != null) _buildSpeechBubble(),
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }

  String _getImagePath() {
    if (todo == null) {
      // 空のスロット用画像（dart.pngと同じサイズ）
      return 'assets/images/dart.png';
    } else if (todo!.isCompleted) {
      // 完了タスク用画像（dart.pngと同じサイズ）
      return 'assets/images/dart_flower.png';
    } else {
      // 未完了タスク用画像（dart.pngと同じサイズ）
      return 'assets/images/dart_me.png';
    }
  }

  Widget _buildSpeechBubble() {
    return Positioned(
      top: 8,
      right: 8,
      child: CustomPaint(
        painter: SpeechBubblePainter(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          constraints: const BoxConstraints(maxWidth: 160),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // タイトル
              Text(
                todo!.title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              // 期日
              Text(
                DateFormat('M/d', 'ja').format(todo!.dueDate),
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpeechBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.9)
      ..style = PaintingStyle.fill;
    
    final path = Path();
    const radius = 8.0;
    
    // 吹き出しのメイン部分
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height - 8),
      const Radius.circular(radius),
    ));
    
    // 吹き出しの尻尾（下左に向かう三角形）
    path.moveTo(size.width * 0.2, size.height - 8);
    path.lineTo(size.width * 0.1, size.height);
    path.lineTo(size.width * 0.4, size.height - 8);
    path.close();
    
    canvas.drawPath(path, paint);
    
    // 影を追加
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    
    canvas.drawPath(path.shift(const Offset(1, 1)), shadowPaint);
    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}