import 'package:flutter/material.dart';
import '../models/task_item.dart';
import '../widgets/task_tile.dart';

class TaskHomeView extends StatefulWidget {
  const TaskHomeView({super.key});

  @override
  State<TaskHomeView> createState() => _TaskHomeViewState();
}

class _TaskHomeViewState extends State<TaskHomeView> {
  final List<TaskItem> _list = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() => _list.add(TaskItem(label: text)));

    _controller.clear();
    Navigator.pop(context);
  }

  void _toggle(int index) {
    setState(() => _list[index].done = !_list[index].done);
  }

  void _remove(int index) {
    setState(() => _list.removeAt(index));
  }

  void _openAddDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("New Task", style: TextStyle(fontWeight: FontWeight.w600)),
          content: TextField(
            controller: _controller,
            autofocus: true,
            decoration: const InputDecoration(hintText: "Type something gentle..."),
            onSubmitted: (_) => _addTask(),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
            ElevatedButton(
              onPressed: _addTask,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3AAFA9),
                foregroundColor: Colors.white,
              ),
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final pending = _list.where((t) => !t.done).length;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFF3AAFA9),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text("$pending pending", style: const TextStyle(color: Colors.white)),
        ),
      ),
      body: _list.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline,
                      size: 90, color: Colors.teal.withOpacity(.25)),
                  const SizedBox(height: 20),
                  Text(
                    "Nothing here yet",
                    style: TextStyle(color: Colors.teal.withOpacity(.5), fontSize: 18),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: _list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                return TaskTile(
                  item: _list[index],
                  onToggle: () => _toggle(index),
                  onDelete: () => _remove(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddDialog,
        backgroundColor: const Color(0xFF3AAFA9),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
