import 'package:flutter_riverpod/flutter_riverpod.dart';

final uploadImageResultProvider = StateProvider.autoDispose<String?>(
  (_) => null,
  name: 'uploadImageResultProvider',
);
