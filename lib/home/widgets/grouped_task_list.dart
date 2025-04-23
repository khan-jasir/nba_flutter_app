import 'package:flutter/material.dart';
import 'package:nba_flutter_app/home/data/models/task_item.dart';
import 'package:nba_flutter_app/home/widgets/grouped_tasks.dart';
import 'package:intl/intl.dart';

class GroupedTaskList extends StatelessWidget {
  final List<TaskItem> tasks;
  final void Function(TaskItem task)? onTaskTap;

  const GroupedTaskList({
    super.key,
    required this.tasks,
    this.onTaskTap,
  });

  @override
  Widget build(BuildContext context) {
    final groupedTasks = TaskItem.groupByStatus(tasks);

    return Column(
      children: groupedTasks.entries.map((entry) {
        final status = entry.key;
        final tasksInGroup = entry.value;
        
        // Get the most recent assignment date from the group
        final latestTask = tasksInGroup.reduce((a, b) {
          final aDate = a.startDate ?? '';
          final bDate = b.startDate ?? '';
          return aDate.compareTo(bDate) > 0 ? a : b;
        });
        
        return GroupedTasks(
          groupTitle: _formatStatusTitle(status),
          tasks: tasksInGroup,
          timestamp: _formatTimestamp(latestTask.startDate ?? ''),
          onTaskTap: onTaskTap,
        );
      }).toList(),
    );
  }

  String _formatStatusTitle(String status) {
    switch (status.toLowerCase()) {
      case 'work in progress':
        return 'Work In Progress';
      case 'closure requested':
        return 'Closure Requested';
      case 'rescheduling requested':
        return 'Rescheduling Requested';
      default:
        return status;
    }
  }

  String _formatTimestamp(String date) {
    if (date.isEmpty) return 'No date';
    
    try {
      final DateTime parsedDate = DateTime.parse(date);
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final yesterday = today.subtract(const Duration(days: 1));
      final taskDate = DateTime(parsedDate.year, parsedDate.month, parsedDate.day);

      if (taskDate == today) {
        return 'Today, ${DateFormat('h:mm a').format(parsedDate)}';
      } else if (taskDate == yesterday) {
        return 'Yesterday, ${DateFormat('h:mm a').format(parsedDate)}';
      } else {
        return DateFormat('MMM d, h:mm a').format(parsedDate);
      }
    } catch (e) {
      return 'Invalid date';
    }
  }
} 