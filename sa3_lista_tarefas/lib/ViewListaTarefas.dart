import 'package:flutter/material.dart';
import 'package:sa3_lista_tarefas/Viewlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sa3_lista_tarefas/TarefasController.dart';

class Tarefa {
  String titulo;
  bool concluida;

  Tarefa({required this.titulo, this.concluida = false});
}

class ListaTarefaPage extends StatefulWidget {
  final String email;

  ListaTarefaPage({required this.email});

  @override
  _ListaTarefaPageState createState() => _ListaTarefaPageState(email: email);
}

class _ListaTarefaPageState extends State<ListaTarefaPage> {
  List<Tarefa> tasks = []; // Lista de tarefas
  final TextEditingController _controller = TextEditingController();
  late ListaTarefaController _listaTarefaController;
  final String email;

  _ListaTarefaPageState({required this.email}) {
    _listaTarefaController = ListaTarefaController(email: email);
  }

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    tasks = (await _listaTarefaController.loadTasks())
        .map((titulo) => Tarefa(titulo: titulo))
        .toList();
    setState(() {});
  }

  Future<void> _saveTasks() async {
    await _listaTarefaController.saveTasks(tasks.map((tarefa) => tarefa.titulo).toList());
  }

  void _logout() async {
    // Limpar informações de login
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('${email}email');
    // Navegar para tela de login
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      _saveTasks();
    });
  }

  void _updateTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController _updateController = TextEditingController(text: tasks[index].titulo);
        return AlertDialog(
          title: Text('Atualizar Tarefa'),
          content: TextField(
            controller: _updateController,
            decoration: InputDecoration(
              hintText: 'Editar tarefa',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  tasks[index].titulo = _updateController.text;
                  _saveTasks();
                  Navigator.of(context).pop();
                });
              },
              child: Text('Atualizar'),
            ),
          ],
        );
      },
    );
  }

void _toggleTaskCompleted(int index) {
  setState(() {
    // Altera o estado de concluída da tarefa
    tasks[index].concluida = !tasks[index].concluida;
    _saveTasks(); // Salva a lista de tarefas atualizadas
    if (tasks[index].concluida) {
      // Se a tarefa estiver concluída, você pode adicionar algum código adicional aqui, se necessário
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              tasks[index].titulo,
              style: TextStyle(
                decoration: tasks[index].concluida ? TextDecoration.lineThrough : null,
              ),
            ),
            onTap: () => _updateTask(index), // Atualizar tarefa ao pressionar
            onLongPress: () => _deleteTask(index), // Excluir tarefa ao pressionar e segurar
            trailing: Checkbox(
              value: tasks[index].concluida,
              onChanged: (value) => _toggleTaskCompleted(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Nova Tarefa'),
                content: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Digite a tarefa',
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        tasks.add(Tarefa(titulo: _controller.text));
                        _saveTasks();
                        _controller.clear();
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text('Adicionar'),
                  ),
                  TextButton(
                    onPressed: () {
                      _controller.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
