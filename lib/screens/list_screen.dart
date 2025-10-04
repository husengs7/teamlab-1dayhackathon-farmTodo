import 'package:flutter/material.dart';

import '../services/todo_service.dart';
import '../widgets/todo_list.dart';
import '../widgets/background_widget.dart';
import '../widgets/middle_layer_widget.dart';
import 'add_todo_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key, required this.todoService});

  final TodoService todoService;

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  // TodoList の状態を操作するためのキー
  Key _todoListKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent, // 背景を透明に
        appBar: AppBar(
          title: Image.asset(
            'assets/images/logo.png', // ロゴ画像のパス
            height: 40, // ロゴの高さ
            fit: BoxFit.contain,
          ),
          backgroundColor: Colors.transparent, // AppBarも透明に
          elevation: 0, // 影を削除
          centerTitle: true, // ロゴを中央に配置
        ),
        body: MiddleLayerWidget(
          child: TodoList(
            key: _todoListKey,
            todoService: widget.todoService,
          ),
        ), // MiddleLayerWidgetをbodyの中に配置
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // 画面遷移し、戻ってきたら結果（新規 Todo）を受け取る
            final updated = await Navigator.push( // Todoに追加があったらtrueを返す
              context,
              MaterialPageRoute(
                  builder: (context) => AddTodoScreen(
                        todoService: widget.todoService,  // 引数としてtodoServiceを渡す
                      )),
            );

            // 追加があったら再描画（TodoList を再取得）
            if (updated == true) {
              setState(() {
                _todoListKey = UniqueKey(); // 新しいキーで TodoList を再構築
              });
            }
          },
          child: const Icon(Icons.local_florist), // 花のアイコン
        ),
      ),
    );
  }
}