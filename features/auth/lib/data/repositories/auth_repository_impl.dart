import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User?> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return User(id: '1', email: email); // always returns a "logged in" user
  }
}
