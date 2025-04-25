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

        // Count overdue and nearing due tasks
        final (overdueCount, nearingDueCount) = _countDueTasks(tasksInGroup);
        
        return GroupedTasks(
          groupTitle: TaskItem.getTaskTypeTitle(taskType, tasksInGroup.length),
          tasks: _sortTasksByPriority(tasksInGroup),
          timestamp: _formatTimestamp(latestTask.startDate ?? '', overdueCount, nearingDueCount),
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

  (int, int) _countDueTasks(List<TaskItem> tasks) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    int overdueCount = 0;
    int nearingDueCount = 0;

    for (final task in tasks) {
      if (task.endDate?.isEmpty ?? true) {
        nearingDueCount++; // Consider tasks without dates as overdue
        continue;
      }

      try {
        final taskDate = DateTime.parse(task.endDate!);
        final daysUntilDue = DateTime(taskDate.year, taskDate.month, taskDate.day)
            .difference(today)
            .inDays;

        if (daysUntilDue < 0) {
          overdueCount++;
        } else if (daysUntilDue <= 2) {
          nearingDueCount++;
        }
      } catch (e) {
        overdueCount++; // Consider invalid dates as overdue
      }
    }

    return (overdueCount, nearingDueCount);
  }

  String _formatTimestamp(String date, int overdueCount, int nearingDueCount) {
    final List<String> parts = [];
    
    // Add overdue count if any
    if (overdueCount > 0) {
      parts.add('$overdueCount overdue');
    }

    // Add nearing due count if any
    if (nearingDueCount > 0) {
      parts.add('$nearingDueCount due soon');
    }

    // If no due tasks, show regular timestamp
    if (parts.isEmpty) {
      if (date.isEmpty) {
        return 'No due date';
      } else {
        try {
          final DateTime parsedDate = DateTime.parse(date);
          return DateFormat('MMM d, h:mm a').format(parsedDate);
        } catch (e) {
          return 'Invalid date';
        }
      }
    }

    return parts.join(' • ');
  }
} 