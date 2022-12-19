import 'package:flutter_riverpod/flutter_riverpod.dart';

final addImageResultProvider = StateProvider<AsyncValue<bool?>>(
  (_) => const AsyncValue.data(null),
  name: 'addImageResultProvider',
);
