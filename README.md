# 🌱 TODOファーム 🌱

農場ゲーム風のデザインを採用したTodoリストアプリです。

## 特徴

- 🌿 農場テーマのほっこりとしたデザイン
- 📝 タスクの追加・編集・削除機能
- 🌸 完了したタスクは花のアイコンで表示
- 💾 データの永続化（SharedPreferences使用）
- 📅 期日設定機能

## 使い方

1. 右下の花ボタンでタスクを追加
2. タスクをタップして完了状態に変更
3. 完了したタスクをもう一度タップで削除

## 技術スタック

- Flutter
- Dart
- SharedPreferences（データ保存）
- UUID（一意ID生成）

## セットアップ

```bash
# 依存関係をインストール
flutter pub get

# アプリを実行
flutter run
```

## 依存関係

- `flutter`: Flutter SDK
- `intl`: 日付フォーマット
- `uuid`: 一意ID生成
- `shared_preferences`: ローカルデータ保存