import 'package:stamp_rally/domain/repository/user/entity/user.dart';
import 'package:stamp_rally/domain/repository/user/entity/user_input_data.dart';
import 'package:stamp_rally/domain/repository/user/user_repository.dart';

class MockUserRepository implements UserRepository {
  @override
  Future<void> deleteUser() async {
    // TODO(cobo): implement deleteUser
    throw UnimplementedError();
  }

  @override
  Stream<bool> loggedInChanges() {
    // TODO(cobo): implement loggedInChanges
    throw UnimplementedError();
  }

  @override
  Future<void> loginAnonymously() {
    // TODO(cobo): implement loginAnonymously
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO(cobo): implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(UserInputData inputData) {
    // TODO(cobo): implement updateUser
    throw UnimplementedError();
  }

  @override
  Stream<User?> userChanges() {
    // TODO(cobo): implement userChanges
    throw UnimplementedError();
  }

  @override
  Future<User?> getUser() {
    // TODO(cobo): implement getUser
    throw UnimplementedError();
  }
}
