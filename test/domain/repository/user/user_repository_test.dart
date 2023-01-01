import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stamp_rally/domain/repository/user/user_repository.dart';

import '../../../infrastructure/mock/mock_user_repository.dart';
import '../../../test_agent.dart';

void main() {
  final agent = TestAgent();

  setUp(agent.setUp);

  group('userRepositoryProviderのテスト', () {
    test('DIする前は未実装エラーが発生するはず', () {
      expect(
        () => ProviderContainer().read(userRepositoryProvider),
        throwsUnimplementedError,
      );
    });
    test('DIした後は未実装エラーが発生しないこと', () {
      expect(
        agent.container.read(userRepositoryProvider) is MockUserRepository,
        true,
      );
    });
  });
}
