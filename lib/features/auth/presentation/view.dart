import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:xshop/features/auth/domain/repository/repo_interface.dart';
import 'package:xshop/features/auth/domain/usecases/user_usecase.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final username = TextEditingController(text: "testtest");
  final email = TextEditingController(text: "test");
  final password = TextEditingController(text: "mypwd123");
  bool isRegister = false;

  @override
  dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final AuthAbstractRepository repo = GetIt.I.get<AuthAbstractRepository>();

    final useCase = isRegister
        ? RegisterUsecase(authRepository: repo)
        : LoginUsecase(authRepository: repo);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Логотип или заголовок
              Column(
                children: [
                  const SizedBox(height: 32.0),
                  Icon(
                    Icons.lock_outline,
                    size: 100,
                    color: theme.primaryColor,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Добро пожаловать",
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.hintColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Войдите, чтобы продолжить",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.hintColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  isRegister
                      ? TextField(
                          controller: username,
                          decoration: InputDecoration(
                            labelText: "Username",
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        )
                      : const SizedBox(height: 1),
                ],
              ),
              const SizedBox(height: 16.0),

              // Поле ввода email
              TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
              ),
              const SizedBox(height: 16.0),

              // Поле ввода пароля
              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Пароль",
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: const TextStyle(color: Color.fromARGB(255, 82, 82, 82)),
              ),
              const SizedBox(height: 24.0),

              // Кнопка "Войти"
              ElevatedButton(
                onPressed: () {
                  if (useCase is RegisterUsecase) {
                    useCase.call(
                      username: username.text,
                      email: email.text,
                      password: password.text,
                    );
                  }
                  if (useCase is LoginUsecase) {
                    useCase.call(email: email.text, password: password.text);
                  }
                },

                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: isRegister
                    ? const Text("Зарегестрироваться")
                    : const Text("Войти"),
              ),
              const SizedBox(height: 16.0),

              // Кнопка "Зарегистрироваться"
              TextButton(
                onPressed: () {
                  setState(() => isRegister = !isRegister);
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
                child: isRegister
                    ? const Text("Войти")
                    : const Text("Зарегистрироваться"),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
