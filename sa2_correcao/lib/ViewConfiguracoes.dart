import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sa2_correcao/ViewLogin.dart'; // Importe a tela de login ou substitua pelo caminho correto

class ConfiguracoesPage extends StatefulWidget {
  final String email;

  ConfiguracoesPage({required this.email});

  @override
  _ConfiguracoesPageState createState() =>
      _ConfiguracoesPageState(email: email);
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  late SharedPreferences _prefs;
  bool _darkMode = false;
  final String email;
  String idioma = 'PT-BR';
  List<String> idiomas = ['PT-BR', 'EN-US', 'ES-AR'];

  _ConfiguracoesPageState({required this.email});

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = _prefs.getBool('${email}darkMode') ?? false;
    });
  }

  Future<void> _mudarDarkMode(bool value) async {
    setState(() {
      _darkMode = value;
    });
    await _prefs.setBool('${email}darkMode', value);
  }

  Future<void> _mudarIdioma(String? newValue) async {
    if (newValue != null) {
      setState(() {
        idioma = newValue;
      });
      // Implemente a lógica para mudar o idioma
    }
  }

  Future<void> _logout() async {
    // Limpe as informações de login (por exemplo, o email armazenado)
    await _prefs.remove('${email}email');
    // Navegue de volta para a tela de login
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _darkMode ? ThemeData.dark() : ThemeData.light(),
      duration: Duration(milliseconds: 500),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Teste de Armazenamento Interno'),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Selecione o Modo Escuro"),
              Switch(
                value: _darkMode,
                onChanged: (value) {
                  _mudarDarkMode(value);
                },
              ),
              Text("Selecione o Idioma"),
              DropdownButton<String>(
                value: idioma,
                onChanged: _mudarIdioma,
                items: idiomas.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: _logout,
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
