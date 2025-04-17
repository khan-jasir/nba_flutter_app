import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_flutter_app/home/view/cubit/home_state.dart';
import 'package:nba_flutter_app/task_details/view/task_details.dart';
import 'package:nba_flutter_app/home/data/models/task_data.dart';
import 'package:nba_flutter_app/home/view/cubit/home_cubit.dart';
import 'package:nba_flutter_app/home/widgets/home_header.dart';
import 'package:nba_flutter_app/home/widgets/profile_header.dart';
import 'package:nba_flutter_app/home/widgets/task_list.dart';
import 'package:nba_flutter_app/home/widgets/task_list_shimmer.dart';
import 'package:nba_flutter_app/home/widgets/task_tile.dart';
import 'package:nba_flutter_app/home/widgets/wr_calendar.dart';
import 'package:nba_flutter_app/utils/api_status.dart';
import 'package:nba_flutter_app/utils/page_transition.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    //context.read<HomeCubit>().getTask();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff09161C),
        body: SingleChildScrollView(
          primary: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(),
              BlocBuilder<HomeCubit,HomeState>(
                builder: (context, state) {
                  if(state.apiStatus.isSuccess) {
                    final totalActivities = state.taskList.length;
                    final completeActivities = state.taskList.where((task) =>  task.finalStatus.toLowerCase() == 'completed').toList().length;
                    return HomeHeader(totalActivities: totalActivities, activitiesClosed: completeActivities);
                  } else {
                    return HomeHeader(totalActivities: 0, activitiesClosed: 0);
                  }
                },
              ),
              CustomCalendar(
                onDateSelected: (value) {
                  context.read<HomeCubit>().getTask(
                    selectedDate: value
                  );
                },
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 15, right: 15, top: 30),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Image.asset('assets/icons/todo.png', width: 24, height: 24),
              //       SizedBox(width: 5),
              //       Text(
              //         'Pending (6)',
              //         style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.w800,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final taskList = state.taskList;
                    final pendingTaskList = state.pendingTaskList;
                    final apiStatus = state.apiStatus;
                    if(apiStatus.isLoading) {
                      return TaskListShimmer();
                    } else if(apiStatus.isSuccess) {
                      return TaskListItems(
                        pendingTaskItems: pendingTaskList,
                        taskItems: taskList);
                    } else if(apiStatus.isEmpty) {
                      return Center(
                        child: Text('No Task Found',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                        ),),
                      );
                    } else {
                      return Center(
                        child: Text('Something went Wrong',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
