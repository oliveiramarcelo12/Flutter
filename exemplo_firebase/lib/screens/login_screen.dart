import 'package:exemplo_firebase/screens/todolist_screen.dart';
import 'package:exemplo_firebase/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {},
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: _acessarTodoList,
                    child: const Text("Login"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text("Cadastrar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<User?> _loginUser() async {
    if (_formKey.currentState!.validate()) {
      return await _auth.loginUsuario(
        _emailController.text,
        _passwordController.text,
      );
    } else {
      return null;
    }
  }

  Future<void> _acessarTodoList() async {
    User? user = await _loginUser();
    if (user != null) {
      print("ok");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TodolistScreen(user: user),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Usuário ou senha inválidos"),
        ),
      );
      _emailController.clear();
      _passwordController.clear();
    }
  }
}
