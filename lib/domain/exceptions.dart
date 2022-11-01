/// 基底ドメイン例外
///
/// ドメイン層が定義する例外の基底クラス
abstract class DomainException implements Exception {
  const DomainException(this.message);

  final Object message;
}

/// ドメイン層で発生する入力値検査例外
class ValidatorException extends DomainException {
  const ValidatorException._([
    super.message = 'validator exception',
    String? code,
    this.target,
  ]) : code = code ?? codeUnknown;

  /// 引数が不正
  factory ValidatorException.invalidArgument([String? target]) =>
      ValidatorException._(
        'Invalid argument',
        codeInvalidArgument,
        target,
      );

  // エラーコードの定義
  static const codeInvalidArgument = 'invalid-argument';
  static const codeUnknown = 'unknown';

  /// エラーコード
  final String code;

  /// 対象
  final String? target;

  @override
  String toString() => 'ValidatorException: $message';
}

/// インフラストラクチャ層で発生するデータベース関連の例外
///
/// リポジトリ実装がこの例外を投げたら、プレゼンテーション層
/// で受け取って適切に表示すること。
class DatabaseException extends DomainException {
  const DatabaseException._([
    super.message = 'database exception',
    String? code,
  ]) : code = code ?? codeUnknown;

  /// `Not Found`
  factory DatabaseException.notFound() => const DatabaseException._(
        'No data found.',
        codeNotFound,
      );

  /// 不明なエラー
  factory DatabaseException.unknown() => const DatabaseException._(
        'An unknown error has occurred.',
        codeUnknown,
      );

  // エラーコードの定義
  static const codeNotFound = 'not-found';
  static const codeUnknown = 'unknown';

  /// エラーコード
  final String code;

  @override
  String toString() => 'DatabaseException[$code]: $message';
}

/// インフラストラクチャ層で発生するネットワーク関連の例外
///
/// リポジトリ実装がこの例外を投げたら、プレゼンテーション層
/// で受け取って適切に表示すること。
class NetworkException extends DomainException {
  const NetworkException._([
    super.message = 'network exception',
    String? code,
  ]) : code = code ?? codeUnknown;

  /// 1. 無効なJSONを送信すると、`400 Bad Request` レスポンスが返されます。
  /// 2. 間違ったタイプの JSON 値を送信すると、`400 Bad Request` レスポンスが返されます。
  factory NetworkException.badRequest() => const NetworkException._(
        'Illegal request sent. (400)',
        codeBadRequest,
      );

  /// 無効な認証情報で認証すると、`401 Unauthorized` が返されます。
  factory NetworkException.badCredentials() => const NetworkException._(
        'Illegal request sent. (401)',
        codeBadCredentials,
      );

  /// API は、無効な認証情報を含むリクエストを短期間に複数回検出すると、`403 Forbidden` で、
  /// そのユーザーに対するすべての認証試行（有効な認証情報を含む）を一時的に拒否します。
  factory NetworkException.maximumNumberOfLoginAttemptsExceeded() =>
      const NetworkException._(
        'Please wait a while and try again. (403)',
        codeMaximumNumberOfLoginAttemptsExceeded,
      );

  /// `404 Not Found`
  factory NetworkException.notFound() => const NetworkException._(
        'No data found. (404)',
        codeNotFound,
      );

  /// 無効なフィールドを送信すると、`422 Unprocessable Entity` レスポンスが返されます。
  factory NetworkException.validationFailed() => const NetworkException._(
        'Illegal request sent. (422)',
        codeValidationFailed,
      );

  /// `503 Service Unavailable` サービス停止中
  factory NetworkException.serviceUnavailable() => const NetworkException._(
        'Please wait a while and try again.  (503)',
        codeServiceUnavailable,
      );

  /// インターネット接続不可
  factory NetworkException.noInternetConnection() => const NetworkException._(
        'Please try again in a good communication environment. (-2)',
        codeNoInternetConnection,
      );

  /// 不明なエラー
  factory NetworkException.unknown() => const NetworkException._(
        'An unknown error has occurred. (-1)',
        codeUnknown,
      );

  // エラーコードの定義
  static const codeBadRequest = 'bad-request';
  static const codeBadCredentials = 'bad-credentials';
  static const codeMaximumNumberOfLoginAttemptsExceeded =
      'maximum-number-of-login-attempts-exceeded';
  static const codeNotFound = 'not-found';
  static const codeValidationFailed = 'validation-failed';
  static const codeServiceUnavailable = 'service-unavailable';
  static const codeNoInternetConnection = 'no-internet-connection';
  static const codeUnknown = 'unknown';

  /// エラーコード
  final String code;

  @override
  String toString() => 'NetworkException[$code]: $message';
}

/// インフラストラクチャ層で発生する認証関連の例外
///
/// リポジトリ実装がこの例外を投げたら、プレゼンテーション層
/// で受け取って適切に表示すること。
class AuthException extends DomainException {
  const AuthException._([
    super.message = 'auth exception',
    String? code,
  ]) : code = code ?? codeUnknown;

  factory AuthException.invalidEmail() => const AuthException._(
        'The email address is badly formatted.',
        codeInvalidEmail,
      );
  factory AuthException.wrongPassword() => const AuthException._(
        'The password is invalid or the user does not have a password.',
        codeWrongPassword,
      );
  factory AuthException.weakPassword() => const AuthException._(
        'Password should be at least 6 characters.',
        codeWeakPassword,
      );
  factory AuthException.userNotFound() => const AuthException._(
        'There is no user record corresponding to this identifier. '
        'The user may have been deleted.',
        codeUserNotFound,
      );
  factory AuthException.userDisabled() => const AuthException._(
        'The user account has been disabled by an administrator.',
        codeUserDisabled,
      );
  factory AuthException.tooManyRequests() => const AuthException._(
        '',
        codeTooManyRequests,
      );
  factory AuthException.operationNotAllowed() => const AuthException._(
        '',
        codeOperationNotAllowed,
      );
  factory AuthException.networkRequestFailed() => const AuthException._(
        '',
        codeNetworkRequestFailed,
      );
  factory AuthException.emailAlreadyInUse() => const AuthException._(
        'The email address is already in use by another account.',
        codeEmailAlreadyInUse,
      );
  factory AuthException.userMismatch() => const AuthException._(
        '',
        codeUserMismatch,
      );

  factory AuthException.invalidActionCode() => const AuthException._(
        'The provided email is already in use by an existing user. '
        'Each user must have a unique email.',
        codeInvalidActionCode,
      );

  factory AuthException.notVerifiedEmail() => const AuthException._(
        'Not verified email.',
        codeNotVerifiedEmail,
      );

  factory AuthException.requiresRecentLogin() => const AuthException._(
        'This operation is sensitive and requires recent authentication. '
        'Log in again before retrying this request.',
        codeRequiresRecentLogin,
      );

  /// 不明なエラー
  factory AuthException.unknown() => const AuthException._(
        'An unknown error has occurred.',
        codeUnknown,
      );

  // エラーコードの定義
  static const codeInvalidEmail = 'invalid-email';
  static const codeWrongPassword = 'wrong-password';
  static const codeWeakPassword = 'weak-password';
  static const codeUserNotFound = 'user-not-found';
  static const codeUserDisabled = 'user-disabled';
  static const codeTooManyRequests = 'too-many-requests';
  static const codeOperationNotAllowed = 'operation-not-allowed';
  static const codeNetworkRequestFailed = 'network-request-failed';
  static const codeEmailAlreadyInUse = 'email-already-in-use';
  static const codeUserMismatch = 'user-mismatch';
  static const codeInvalidActionCode = 'invalid-action-code';
  static const codeNotVerifiedEmail = 'not-verified-email';
  static const codeRequiresRecentLogin = 'requires-recent-login';
  static const codeUnknown = 'unknown';

  /// エラーコード
  final String code;

  @override
  String toString() => 'AuthException[$code]: $message';
}

extension ObjectHelper on Object {
  /// エラーメッセージを返す
  String get errorMessage {
    if (this is NetworkException) {
      final error = this as NetworkException;
      switch (error.code) {
        case NetworkException.codeBadRequest:
          return '不正なリクエストが送信されました (400)';
        case NetworkException.codeBadCredentials:
          return '不正なリクエストが送信されました (401)';
        case NetworkException.codeMaximumNumberOfLoginAttemptsExceeded:
          return 'しばらく時間をおいてから再度お試しください (403)';
        case NetworkException.codeNotFound:
          return 'データが見つかりませんでした (404)';
        case NetworkException.codeValidationFailed:
          return '不正なリクエストが送信されました (422)';
        case NetworkException.codeServiceUnavailable:
          return 'しばらく時間をおいてから再度お試しください (503)';
        case NetworkException.codeUnknown:
          return '不明なエラーが発生しました (-1)';
        case NetworkException.codeNoInternetConnection:
          return '通信環境の良いところで再度お試しください (-2)';
      }
    }
    if (this is AuthException) {
      final error = this as AuthException;
      switch (error.code) {
        case AuthException.codeInvalidEmail:
          return 'メールアドレスを正しい形式で入力してください。';
        case AuthException.codeWrongPassword:
          return 'パスワードが間違っています。';
        case AuthException.codeWeakPassword:
          return 'パスワードは6文字以上にしてください。';
        case AuthException.codeUserNotFound:
          return 'アカウントが見つかりません。';
        case AuthException.codeUserDisabled:
          return '無効なアカウントです。';
        case AuthException.codeTooManyRequests:
          return 'しばらく経ってから再度お試しください。';
        case AuthException.codeOperationNotAllowed:
          return 'ログインが許可されていません。管理者にご連絡ください。';
        case AuthException.codeNetworkRequestFailed:
          return 'タイムアウトしました。';
        case AuthException.codeEmailAlreadyInUse:
          return '既に使われているメールアドレスです。';
        case AuthException.codeUserMismatch:
          return '異なるメールアドレスでログインしようとしています。';
        case AuthException.codeInvalidActionCode:
          return '無効なログインリンクです。ログインリンクが正しいかご確認ください。';
        case AuthException.codeNotVerifiedEmail:
          return '認証が完了していません。メールをご確認ください。';
        case AuthException.codeRequiresRecentLogin:
          return 'ログインし直してから再度お試し下さい。';
        case AuthException.codeUnknown:
          return 'エラーが発生しました。';
      }
    }
    if (this is Exception &&
        toString() == 'Exception: no routes for location: error') {
      return '404 NOT FOUND\nページが見つかりませんでした';
    }
    return toString();
  }
}
