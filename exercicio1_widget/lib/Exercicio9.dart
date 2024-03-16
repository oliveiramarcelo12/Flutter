import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Definindo o número de abas (3 no exemplo)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Example'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Aba 1'),
            Tab(text: 'Aba 2'),
            Tab(text: 'Aba 3'),
          ],
        ),
      ),
      body: TabBarView(
  controller: _tabController,
  children: [
    // Conteúdo da aba 1
    ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item ${index + 1}'),
        );
      },
    ),
    // Conteúdo da aba 2
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Nome'),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Ação a ser executada ao clicar no botão
            },
            child: Text('Enviar'),
          ),
        ],
      ),
    ),
    // Conteúdo da aba 3
    Center(
      child: Image.asset('assets/minha_imagem.png'),
    ),
  ],
),

    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
