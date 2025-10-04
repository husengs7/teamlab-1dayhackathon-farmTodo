import 'package:flutter/material.dart';

import '../models/todo.dart'; // 作成したTodoクラス
import '../services/todo_service.dart'; // データ保存サービス
import '../widgets/task_slot_card.dart'; // タスクスロットカード

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.todoService});

  final TodoService todoService; // ← 追加

  @override
  State<TodoList> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  List<Todo> _todos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTodos(); // SharedPreferences から読み込み
  }

  Future<void> _loadTodos() async {
    final todos = await widget.todoService.getTodos();
    setState(() {
      _todos = todos;
      _isLoading = false;
    });
  }

  // 追加画面から呼ばれる
  void addTodo(Todo newTodo) async {
    setState(() => _todos.add(newTodo));
    await widget.todoService.saveTodos(_todos);
  }

  // 未チェック → チェック → 削除
  Future<void> _toggleTodo(Todo todo) async {
    final index = _todos.indexWhere((t) => t.id == todo.id);
    if (index == -1) return;

    if (todo.isCompleted) {
      // チェック → 削除
      _todos.removeAt(index);
    } else {
      // チェックなし → 完了に切り替え
      _todos[index] = todo.copyWith(isCompleted: true);
    }

    setState(() {});
    await widget.todoService.saveTodos(_todos);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return GridView.builder(
      padding: const EdgeInsets.all(32.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 横に2つ
        crossAxisSpacing: 0.5, // 横の間隔を最小に
        mainAxisSpacing: 0.5, // 縦の間隔を最小に
        childAspectRatio: 1.0, // 正方形
      ),
      itemCount: 4, // 固定で4スロット
      itemBuilder: (context, index) {
        final todo = index < _todos.length ? _todos[index] : null;
        return TaskSlotCard(
          todo: todo,
          slotIndex: index,
          onToggle: todo != null ? () => _toggleTodo(todo) : null,
        );
      },
    );  
  }
}