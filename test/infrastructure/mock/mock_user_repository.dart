import 'package:stamp_rally/domain/repository/user/entity/user.dart';
import 'package:stamp_rally/domain/repository/user/entity/user_input_data.dart';
import 'package:stamp_rally/domain/repository/user/user_repository.dart';

class MockUserRepository implements UserRepository {
  @override
  Future<void> deleteUser() async {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Stream<bool> loggedInChanges() {
    // TODO: implement loggedInChanges
    throw UnimplementedError();
  }

  @override
  Future<void> loginAnonymously() {
    // TODO: implement loginAnonymously
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(UserInputData inputData) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Stream<User?> userChanges() {
    // TODO: implement userChanges
    throw UnimplementedError();
  }
}
