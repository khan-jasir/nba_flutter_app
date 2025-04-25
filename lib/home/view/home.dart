import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_flutter_app/home/view/cubit/home_state.dart';
import 'package:nba_flutter_app/task_details/view/task_details.dart';
import 'package:nba_flutter_app/home/data/models/task_data.dart';
import 'package:nba_flutter_app/home/view/cubit/home_cubit.dart';
import 'package:nba_flutter_app/home/widgets/home_header.dart';
import 'package:nba_flutter_app/home/widgets/profile_header.dart';
import 'package:nba_flutter_app/home/widgets/task_list_view.dart';
import 'package:nba_flutter_app/home/widgets/task_list_shimmer.dart';
import 'package:nba_flutter_app/home/widgets/wr_calendar.dart';
import 'package:nba_flutter_app/utils/api_status.dart';
import 'package:nba_flutter_app/utils/page_transition.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GroupingType _currentGrouping = GroupingType.byType;

  void _toggleGrouping() {
    setState(() {
      _currentGrouping = _currentGrouping == GroupingType.bydefault
          ? GroupingType.byType
          : GroupingType.bydefault;
    });
  }

  @override
  void initState() {
    super.initState();
    //context.read<HomeCubit>().getTask();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff09161C),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileHeader(),
                  BlocBuilder<HomeCubit,HomeState>(
                    builder: (context, state) {
                      if(state.apiStatus.isSuccess) {
                        final totalActivities = state.taskList.length;
                        final completeActivities = state.taskList
                            .where((task) => task.finalStatus.toLowerCase() == 'completed')
                            .length;
                        return HomeHeader(
                          totalActivities: totalActivities, 
                          activitiesClosed: completeActivities
                        );
                      } else {
                        return const HomeHeader(totalActivities: 0, activitiesClosed: 0);
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0, bottom: 8),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: _toggleGrouping,
                        icon: Icon(
                          _currentGrouping == GroupingType.bydefault
                              ? Icons.view_list
                              : Icons.view_agenda,
                          color: Colors.white,
                          size: 24,
                        ),
                        tooltip: _currentGrouping == GroupingType.bydefault
                            ? 'Group by Type'
                            : 'Group by Status',
                      ),
                    ),
                  ),
                  CustomCalendar(
                    onDateSelected: (value) {
                      context.read<HomeCubit>().getTask(selectedDate: value);
                    },
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if(state.apiStatus.isLoading) {
                    return const SliverToBoxAdapter(
                      child: TaskListShimmer(),
                    );
                  } else if(state.apiStatus.isSuccess) {
                    return SliverToBoxAdapter(
                      child: TaskListView(
                        tasks: state.taskList,
                        grouping: _currentGrouping,
                      ),
                    );
                  } else if(state.apiStatus.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'No Tasks Found',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Something went Wrong',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                          ),
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
    );
  }
}
