import 'package:flutter/material.dart';
import 'package:intl/intl.dart';    // 日付フォーマット用パッケージ
import '../models/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;                // 表示する Todo データ
  final VoidCallback? onToggle;   // 完了トグル用コールバック（任意）
  const TodoCard({
    super.key,
    required this.todo,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFA5D6A7), // 明るい緑色
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: AspectRatio(
        aspectRatio: 1.0, // 正方形にする
        child: InkWell(
          onTap: onToggle,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // アイコン
                Icon(
                  todo.isCompleted
                      ? Icons.local_florist   // 花のアイコン（完了）
                      : Icons.eco, // 葉のアイコン（未完了）
                  color: todo.isCompleted ? const Color(0xFFE91E63) : const Color(0xFF4CAF50),
                  size: 20,
                ),
                const SizedBox(height: 4),
                // タイトル
                Text(
                  todo.title,
                  style: const TextStyle(
                    color: Color(0xFF2E7D32),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                // 期日
                Text(
                  DateFormat('M/d', 'ja').format(todo.dueDate),
                  style: const TextStyle(
                    color: Color(0xFF388E3C),
                    fontSize: 9,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}