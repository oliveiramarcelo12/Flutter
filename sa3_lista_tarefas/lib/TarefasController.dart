import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaTarefaController {
  final String email;
  late SharedPreferences _prefs;

  ListaTarefaController({required this.email});

  Future<List<String>> loadTasks() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getStringList('${email}tasks') ?? [];
  }

  Future<void> saveTasks(List<String> tasks) async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setStringList('${email}tasks', tasks);
  }

  Future<void> addTask(String task) async {
    List<String> currentTasks = await loadTasks();
    currentTasks.add(task);
    await saveTasks(currentTasks);
  }

  Future<void> updateTask(int index, String newTask) async {
    List<String> currentTasks = await loadTasks();
    currentTasks[index] = newTask;
    await saveTasks(currentTasks);
  }

  Future<void> deleteTask(int index) async {
    List<String> currentTasks = await loadTasks();
    currentTasks.removeAt(index);
    await saveTasks(currentTasks);
  }

  Future<void> markTaskCompleted(int index) async {
    List<String> currentTasks = await loadTasks();
    // Adicione um marcador ou texto para indicar que a tarefa foi concluída
    currentTasks[index] = currentTasks[index] + ' (Concluída)';
    await saveTasks(currentTasks);
  }

  Future<List<String>> loadCompletedTasks() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getStringList('${email}completed_tasks') ?? [];
  }

  Future<void> saveCompletedTasks(List<String> completedTasks) async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setStringList('${email}completed_tasks', completedTasks);
  }
}
