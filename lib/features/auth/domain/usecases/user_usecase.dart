import 'package:xshop/features/auth/domain/repository/repo_interface.dart';

abstract class AuthUsecase {
  final AuthAbstractRepository authRepository;

  AuthUsecase({required this.authRepository});

  call({email, password});
}

class LoginUsecase implements AuthUsecase {
  @override
  final AuthAbstractRepository authRepository;
  LoginUsecase({required this.authRepository});

  @override
  call({email, password}) async {
    return await authRepository.login(email: email, password: password);
  }
}

class RegisterUsecase implements AuthUsecase {
  @override
  final AuthAbstractRepository authRepository;
  RegisterUsecase({required this.authRepository});

  @override
  call({username, email, password}) async {
    return await authRepository.register(
      username: username,
      email: email,
      password: password,
    );
  }
}
