import 'package:flutter/material.dart';
import 'package:nba_flutter_app/home/data/models/task_item.dart';
import 'package:nba_flutter_app/home/widgets/grouped_tasks.dart';
import 'package:intl/intl.dart';

class TypeGroupedTaskList extends StatelessWidget {
  final List<TaskItem> tasks;
  final bool showEmptyGroups;
  final void Function(TaskItem task)? onTaskTap;

  const TypeGroupedTaskList({
    super.key,
    required this.tasks,
    this.showEmptyGroups = false,
    this.onTaskTap,
  });

  @override
  Widget build(BuildContext context) {
    final groupedTasks = TaskItem.groupByType(tasks);

    // Filter out empty groups if showEmptyGroups is false
    final groups = showEmptyGroups
        ? groupedTasks
        : Map.fromEntries(
            groupedTasks.entries.where((e) => e.value.isNotEmpty),
          );

    return Column(
      children: groups.entries.map((entry) {
        final taskType = entry.key;
        final tasksInGroup = entry.value;
        
        // Get the most recent task from the group
        final latestTask = tasksInGroup.reduce((a, b) {
          final aDate = a.startDate ?? '';
          final bDate = b.startDate ?? '';
          return aDate.compareTo(bDate) > 0 ? a : b;
        });
        
        return GroupedTasks(
          groupTitle: TaskItem.getTaskTypeTitle(taskType, tasksInGroup.length),
          tasks: _sortTasksByPriority(tasksInGroup),
          timestamp: _formatTimestamp(latestTask.startDate ?? ''),
          onTaskTap: onTaskTap,
        );
      }).toList(),
    );
  }

  // Sort tasks by priority (High -> Medium -> Low)
  List<TaskItem> _sortTasksByPriority(List<TaskItem> tasks) {
    return List<TaskItem>.from(tasks)
      ..sort((a, b) => a.priorityOrder.compareTo(b.priorityOrder));
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