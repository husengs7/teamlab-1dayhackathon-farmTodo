# 🌱 背景画像の配置方法 🌱

## 📁 画像の配置場所
このフォルダ（`assets/images/`）に背景画像を配置してください。

## 🖼️ 画像の仕様

### 🌄 背景画像（一番後ろ）
- **サイズ**: 任意のサイズ（自動リサイズ）
- **形式**: PNG, JPG, JPEG
- **ファイル名**: `farm_background.png` （推奨）

### 🌿 中間レイヤー画像（背景とTodoの間）
- **サイズ**: 任意のサイズ（自動リサイズ）
- **形式**: PNG, JPG, JPEG
- **ファイル名**: `middle_layer.png` （推奨）
- **特徴**: 左右に16pxの余白あり

### 🌱 タスク追加画面用背景画像
- **サイズ**: 任意のサイズ（自動リサイズ）
- **形式**: PNG, JPG, JPEG
- **ファイル名**: `add_screen_background.png` （推奨）

### 🌿 タスク追加画面用中間レイヤー画像
- **サイズ**: 任意のサイズ（自動リサイズ）
- **形式**: PNG, JPG, JPEG
- **ファイル名**: `add_screen_middle_layer.png` （推奨）
- **特徴**: フォーム用に大きめのサイズ

### 🎆 ロゴ画像
- **メイン画面ロゴ**: `logo.png` （推奨高さ: 40px）
- **追加画面ロゴ**: `add_logo.png` （推奨高さ: 40px）
- **形式**: PNG（透明背景推奨）
- **サイズ**: 横長ロゴ推奨（高さ40pxに合わせて自動調整）

### 🌼 タスクスロット用画像（各状態別）
- **空のスロット**: `slot_empty_1.png`, `slot_empty_2.png`, `slot_empty_3.png`, `slot_empty_4.png`
- **未完了タスク**: `slot_active_1.png`, `slot_active_2.png`, `slot_active_3.png`, `slot_active_4.png`
- **完了タスク**: `slot_completed_1.png`, `slot_completed_2.png`, `slot_completed_3.png`, `slot_completed_4.png`
- **サイズ**: 任意のサイズ（正方形推奨）
- **形式**: PNG, JPG, JPEG

## 🔧 設定方法

### 🌄 背景画像の設定
1. 任意のサイズの背景画像を用意
2. このフォルダに `farm_background.png` として保存
3. 異なるファイル名を使用する場合：
   - `lib/widgets/background_widget.dart` の 18行目を編集

### 🌿 中間レイヤー画像の設定
1. 任意のサイズの中間レイヤー画像を用意
2. このフォルダに `middle_layer.png` として保存
3. 異なるファイル名を使用する場合：
   - `lib/widgets/middle_layer_widget.dart` の 20行目と 33行目を編集

### 🌱 タスク追加画面用背景画像の設定
1. 任意のサイズの背景画像を用意
2. このフォルダに `add_screen_background.png` として保存
3. 異なるファイル名を使用する場合：
   - `lib/widgets/add_screen_background_widget.dart` の 14行目を編集

### 🌿 タスク追加画面用中間レイヤー画像の設定
1. 任意のサイズの中間レイヤー画像を用意
2. このフォルダに `add_screen_middle_layer.png` として保存
3. 異なるファイル名を使用する場合：
   - `lib/widgets/add_screen_middle_layer_widget.dart` の 20行目を編集

### 🌼 タスクスロット用画像の設定
1. 各状態用の画像を用意（合計12枚）
2. このフォルダに以下のファイル名で保存：
   - 空のスロット: `slot_empty_1.png` 〜 `slot_empty_4.png`
   - 未完了タスク: `slot_active_1.png` 〜 `slot_active_4.png`
   - 完了タスク: `slot_completed_1.png` 〜 `slot_completed_4.png`
3. 異なるファイル名を使用する場合：
   - `lib/widgets/task_slot_card.dart` の `_getImagePath()` メソッドを編集

### 🎆 ロゴ画像の設定
1. ロゴ画像を用意
2. このフォルダに以下のファイル名で保存：
   - メイン画面ロゴ: `logo.png`
   - 追加画面ロゴ: `add_logo.png`
3. 異なるファイル名を使用する場合：
   - `lib/screens/list_screen.dart` の 28行目を編集
   - `lib/screens/add_todo_screen.dart` の 53行目を編集

## 📱 表示方法

### 🌄 背景画像
- 画面全体を埋めるように表示
- 縦方向にリピートして表示
- **任意のサイズに対応**: 正方形、長方形、どんなサイズでもOK

### 🌿 中間レイヤー画像
- 左右に16pxの余白あり
- 背景画像の上に重ねて表示
- 画面上部と中央部に2つ配置
- **任意のサイズに対応**: 自動リサイズで美しく表示

## 🌟 おすすめ画像テーマ

### 🌄 背景画像
- 農場の風景
- 緑の草原
- 牧場の景色
- 空と地面のグラデーション

### 🌿 中間レイヤー画像
- 花畑のフレーム
- 木の枠組み
- ガラスのパネル
- 半透明の装飾フレーム

## 🎆 サイズの柔軟性
- **制約なし**: どんなサイズの画像でも使用可能
- **自動調整**: Flutterが自動的にリサイズして美しく表示
- **推奨サイズ**: 高解像度の画像を使用するとより美しく表示されます