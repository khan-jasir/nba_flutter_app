import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_flutter_app/home/view/cubit/home_cubit.dart';
import 'package:nba_flutter_app/task_details/view/task_details.dart';
import 'package:nba_flutter_app/home/data/models/task_item.dart';
import 'package:nba_flutter_app/home/widgets/task_tile.dart';
import 'package:nba_flutter_app/utils/page_transition.dart';

class TaskListItems extends StatelessWidget {
  const TaskListItems({
    super.key,
    required this.taskItems,
    required this.pendingTaskItems,
  });

  final List<TaskItem> taskItems;
  final List<TaskItem> pendingTaskItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          primary: false,
          padding: EdgeInsets.symmetric(vertical: 5),
          shrinkWrap: true,
          itemCount: taskItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                pushWithTransition(
                  context, 
                  BlocProvider.value(
                    value: context.read<HomeCubit>(),
                    child: TaskDetailsView(taskItem: taskItems[index],
                  )
                )
              );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: TaskTile(
                  title: taskItems[index].taskName,
                  description: taskItems[index].taskDescription,
                  priorityLevel: taskItems[index].priorityLevel,
                  lob: taskItems[index].lob ?? '',
                  isBirthdayTask: taskItems[index].isBirthdayTask,
                  clientName: taskItems[index].customerName ?? '',
                ),
              ),
            );
          },
        ),

        if (pendingTaskItems.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ':Pending (${pendingTaskItems.length})',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            primary: false,
            padding: EdgeInsets.symmetric(vertical: 5),
            shrinkWrap: true,
            itemCount: pendingTaskItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  pushWithTransition(
                  context, 
                  BlocProvider.value(
                    value: context.read<HomeCubit>(),
                    child: TaskDetailsView(taskItem: taskItems[index],
                  )
                  )
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TaskTile(
                    title: pendingTaskItems[index].taskName,
                    description: pendingTaskItems[index].taskDescription,
                    priorityLevel: pendingTaskItems[index].priorityLevel,
                    lob: pendingTaskItems[index].lob ?? '',
                    isBirthdayTask: pendingTaskItems[index].isBirthdayTask,
                    clientName: pendingTaskItems[index].customerName ?? '',
                  ),
                ),
              );
            },
          ),
        ],
      ],
    );
  }
}
