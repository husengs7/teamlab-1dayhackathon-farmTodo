import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../services/todo_service.dart';
import '../widgets/add_screen_background_widget.dart';
import '../widgets/add_screen_middle_layer_widget.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key, required this.todoService});

  final TodoService todoService;

  @override
  AddTodoScreenState createState() => AddTodoScreenState();
}

class AddTodoScreenState extends State<AddTodoScreen> {
  // 入力内容を管理するコントローラー
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final TextEditingController _dateController =
      TextEditingController(); // 期日表示用

  DateTime? _selectedDate; // 選択された期日

  // フォームの入力検証用
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isFormValid = false; // フォーム入力が完了しているか

  @override
  void initState() {
    super.initState();
    // テキストと期日の入力が変わるたびにチェック
    _titleController.addListener(_updateFormValid);
    _detailController.addListener(_updateFormValid);
    _dateController.addListener(_updateFormValid);
  }

  void _updateFormValid() {
    setState(() {
      _isFormValid = _titleController.text.isNotEmpty &&
          _detailController.text.isNotEmpty &&
          _selectedDate != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AddScreenBackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent, // 背景を透明に
        appBar: AppBar(
          title: Image.asset(
            'assets/images/add_logo.png', // 追加画面用ロゴ画像のパス
            height: 40, // ロゴの高さ
            fit: BoxFit.contain,
          ),
          backgroundColor: Colors.transparent, // AppBarも透明に
          elevation: 0, // 影を削除
          centerTitle: true, // ロゴを中央に配置
        ),
        body: AddScreenMiddleLayerWidget(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              // 入力フォームの枠組み
              key: _formKey,
              child: Column(
                children: [
                  // タイトル入力フィールド
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: '🌿 タスクのタイトル',
                      hintText: '例：レポートを書く、買い物に行く',
                      border: const OutlineInputBorder(),
                      fillColor: Colors.white.withOpacity(0.8), // 白の透明背景
                      filled: true, // 背景を有効に
                    ),
                    validator: (value) {
                      // 入力チェック
                      if (value == null || value.isEmpty) {
                        return 'タスクのタイトルを入力してください';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16), // 余白

                  // 詳細入力フィールド
                  TextFormField(
                    controller: _detailController,
                    decoration: InputDecoration(
                      labelText: '📝 タスクの詳細',
                      hintText: '例：2000字のレポート、スーパーで食材購入',
                      border: const OutlineInputBorder(),
                      fillColor: Colors.white.withOpacity(0.8), // 白の透明背景
                      filled: true, // 背景を有効に
                    ),
                    maxLines: 3, // 複数行入力可能
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'タスクの詳細を入力してください';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // 📅 期日入力フィールド（DatePicker）
                  TextFormField(
                    controller: _dateController,
                    readOnly: true, // キーボードを表示しない
                    decoration: InputDecoration(
                      labelText: '📅 期日',
                      hintText: '年/月/日',
                      border: const OutlineInputBorder(),
                      fillColor: Colors.white.withOpacity(0.8), // 白の透明背景
                      filled: true, // 背景を有効に
                    ),
                    onTap: () async {
                      // 日付選択ダイアログ
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        setState(() {
                          _selectedDate = picked;
                          _dateController.text =
                              '${picked.year}/${picked.month}/${picked.day}';
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '期日を選択してください';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // 作成ボタン
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9), // 白の透明背景
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      onPressed: _isFormValid ? _saveTodo : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isFormValid
                            ? const Color(0xFF66BB6A)
                            : Colors.grey.shade400,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        elevation: 0, // 影を削除して透明背景を活かす
                      ), // 入力完了で活性化
                    child: Text(
                      '🌱 タスクを植える',
                      // テキストの色を変更
                      style: TextStyle(
                        color: _isFormValid ? Colors.white : Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // タスク作成処理
  void _saveTodo() async {
    if (_formKey.currentState!.validate()) {
      // 入力チェック
      // 新しいTodoを作成
      Todo newTodo = Todo(
        title: _titleController.text,
        detail: _detailController.text,
        dueDate: _selectedDate!,
      );

      // 既存リストを取得して追加する処理を追加
      final todos = await widget.todoService.getTodos();
      todos.add(newTodo);
      await widget.todoService.saveTodos(todos);

      // この画面がまだ非表示にならずに残ってるか確認
      if (!mounted) return;

      // 前の画面へ「更新したよ」とだけ知らせる
      Navigator.pop(context, true);
    }
  }

  @override
  void dispose() {
    // 画面が閉じられる時の処理
    _titleController.dispose(); // メモリの解放
    _detailController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 初期表示時にもバリデーション
    _updateFormValid();
  }
}