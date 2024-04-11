import 'package:bloacktut/core/error/failures.dart';
import 'package:bloacktut/core/usecase/usecase.dart';
import 'package:bloacktut/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignUp implements Usecase<String,UserSignUpParams>{
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params)async {
    return await authRepository.signUpWithEmailPassword(name: params.name, email: params.email, password: params.password);
  }

}
class UserSignUpParams{
  final String email;
  final String password;
  final String name;
  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name
  });
}