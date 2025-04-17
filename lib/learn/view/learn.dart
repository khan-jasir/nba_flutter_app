import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_flutter_app/learn/view/cubit/learn_cubit.dart';
import 'package:nba_flutter_app/learn/widgets/expires_soon_course.dart';
import 'package:nba_flutter_app/learn/widgets/learning_status_card.dart';
import 'package:nba_flutter_app/learn/widgets/ongoing_course.dart';
import 'package:nba_flutter_app/learn/widgets/yet_to_start_course.dart';
import 'package:nba_flutter_app/utils/api_status.dart';

class Learn extends StatefulWidget {
  const Learn({super.key});

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  @override
  void initState() {
    super.initState();
    context.read<LearnCubit>().getLearningData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1D26),
      body: SafeArea(
        child: BlocBuilder<LearnCubit, LearnState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LearningStatusCard(
                    expiresSoonCount: 0,
                    ongoingCount: 0,
                    yetToStartCount: 0,
                    isLoading: state.courseApiStatus.isLoading,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Learning Routes',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ExpiresSoonCourse(
                    expiresSoonCourses: state.expiringSoonCourses,
                    isLoading: state.courseApiStatus.isLoading
                  ),
                  OngoingCourse(
                    ongoingCourses: state.onGoingCourses,
                    isLoading: state.courseApiStatus.isLoading,
                  ),
                  YetToStartCourse(
                    yetToStartCourses: state.yetToStartCourses,
                    isLoading: state.courseApiStatus.isLoading,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
