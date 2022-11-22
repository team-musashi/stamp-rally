/// Flavor の文字列
const flavor = String.fromEnvironment('FLAVOR');

/// 本番環境向けかどうか
const isProd = flavor == 'prod';

/// 開発環境向けかどうか
const isDev = flavor == 'dev';
