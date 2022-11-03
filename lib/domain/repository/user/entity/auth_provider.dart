import 'package:collection/collection.dart';

/// 認証プロバイダー
///
/// email や google など認証プロバイダーが増えたらここを増やすこと
enum AuthProvider {
  /// 匿名認証
  anonymous,
  ;

  /// 文字列から AuthProvider を返す
  /// 見つからない場合は anonymous を返す
  static AuthProvider nameOf(String? name) =>
      AuthProvider.values
          .firstWhereOrNull((provider) => provider.name == name) ??
      AuthProvider.anonymous;
}
