import 'package:flutter/material.dart';
import 'package:nba_flutter_app/home/widgets/task_tile.dart';
import 'package:nba_flutter_app/home/data/models/task_item.dart';

class GroupedTasks extends StatefulWidget {
  final String groupTitle;
  final List<TaskItem> tasks;
  final String timestamp;
  final void Function(TaskItem task)? onTaskTap;

  const GroupedTasks({
    super.key,
    required this.groupTitle,
    required this.tasks,
    required this.timestamp,
    this.onTaskTap,
  });

  @override
  State<GroupedTasks> createState() => _GroupedTasksState();
}

class _GroupedTasksState extends State<GroupedTasks> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xff1A2A30),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Header
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.groupTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${widget.tasks.length} items • ${widget.timestamp}',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
          // Expandable content
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: _buildTasksList(),
            crossFadeState: _isExpanded 
                ? CrossFadeState.showSecond 
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(color: Color(0xff2E3F46), height: 1),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: List.generate(
              widget.tasks.length,
              (index) {
                final task = widget.tasks[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index < widget.tasks.length - 1 ? 12 : 0
                  ),
                  child: GestureDetector(
                    onTap: () => widget.onTaskTap?.call(task),
                    child: TaskTile(
                      title: task.taskName,
                      description: task.taskDescription,
                      priorityLevel: task.priorityLevel,
                      lob: task.lob ?? '',
                      clientName: task.customerName ?? '',
                      isBirthdayTask: task.isBirthdayTask,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
} 