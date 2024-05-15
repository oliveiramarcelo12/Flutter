import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text("Previsão do tempo") ,
    centerTitle: true,
    backgroundColor: Colors.black,
    actions: [
      IconButton(icon: Icon(Icons.search), onPressed: (){})
    ],
    ),
    body: Padding(padding: const EdgeInsets.all(12),
    child: Column(children: [
      Row(
        children: [
          ElevatedButton(onPressed: (){}, child: Text("Favoritos")),
          ElevatedButton(onPressed: (){}, child: Text("Pesquisar")),
          ElevatedButton(onPressed: (){}, child: Text("Ajuda"))
        ],
      )
    ],),),
    

    );
  }
}
