import 'package:flutter/material.dart';
import '../models/task_item.dart';

class TaskTile extends StatelessWidget {
  final TaskItem item;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TaskTile({
    super.key,
    required this.item,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.label),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: const Offset(0, 2),
              color: Colors.black.withOpacity(.05),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.label,
                style: TextStyle(
                  fontSize: 17,
                  decoration: item.done ? TextDecoration.lineThrough : null,
                  color: item.done ? Colors.grey : const Color(0xFF17252A),
                ),
              ),
            ),
            Switch(
              value: item.done,
              onChanged: (_) => onToggle(),
              activeColor: const Color(0xFF3AAFA9),
            ),
          ],
        ),
      ),
    );
  }
}
