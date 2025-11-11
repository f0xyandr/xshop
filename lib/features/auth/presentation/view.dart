// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../router/router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final email = TextEditingController(text: "admin@admin.com");
  final password = TextEditingController(text: "admin");

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  const SizedBox(height: 32.0),
                ],
              ),

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
                onPressed: () async {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text("Войти"),
              ),
              const SizedBox(height: 16.0),

              // Кнопка "Зарегистрироваться"
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
                child: const Text("Зарегистрироваться"),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
