import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_flutter_app/home/data/models/task_item.dart';
import 'package:nba_flutter_app/home/view/cubit/home_cubit.dart';
import 'package:nba_flutter_app/home/widgets/grouped_task_list.dart';
import 'package:nba_flutter_app/home/widgets/task_list.dart';
import 'package:nba_flutter_app/home/widgets/type_grouped_task_list.dart';
import 'package:nba_flutter_app/learn/view/course_preview.dart';
import 'package:nba_flutter_app/task_details/view/task_details.dart';
import 'package:nba_flutter_app/utils/page_transition.dart';

enum GroupingType {
  bydefault,
  byType,
}

class TaskListView extends StatelessWidget {
  final List<TaskItem> tasks;
  final GroupingType grouping;

  const TaskListView({
    super.key,
    required this.tasks,
    required this.grouping,
  });

  void _handleTaskTap(BuildContext context, TaskItem task) {
    if (task.isTrainingTask) {
      context.read<HomeCubit>().getCourseDetails(
        sourceId: task.taskSourceId,
        type: task.taskName,
      );
      pushWithTransition(
        context,
        BlocProvider.value(
          value: context.read<HomeCubit>(),
          child: const CoursePreview(),
        ),
      );
    } else {
      pushWithTransition(
        context,
        BlocProvider.value(
          value: context.read<HomeCubit>(),
          child: TaskDetailsView(taskItem: task),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        grouping == GroupingType.bydefault
            ? TaskListItems(taskItems: tasks, pendingTaskItems: tasks.where((task) => task.finalStatus == 'Pending').toList())
            : TypeGroupedTaskList(
                tasks: tasks,
                onTaskTap: (task) => _handleTaskTap(context, task),
              ),
      ],
    );
  }
} 