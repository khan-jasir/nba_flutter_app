import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_flutter_app/home/view/cubit/home_cubit.dart';
import 'package:nba_flutter_app/home/view/cubit/home_state.dart';
import 'package:nba_flutter_app/learn/models/learning_course.dart';
import 'package:nba_flutter_app/learn/widgets/course_card.dart';
import 'package:nba_flutter_app/learn/widgets/course_material_card.dart';
import 'package:nba_flutter_app/utils/api_status.dart';

class CoursePreview extends StatelessWidget {
  const CoursePreview({super.key, this.course});

  final LearningCourse? course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1D26),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (course != null) ...[
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: course!.modules?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: CourseMaterialCard(
                        index: index + 1,
                        learningModule: course!.modules![index],
                      ),
                    );
                  },
                ),
              ] else ...[
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {

                    if(state.courseDetailsApiStatus.isLoading) {
                      return SizedBox.shrink();
                    }

                    if( state.courseDetailsApiStatus.isSuccess && (state.courseDetails == null)) {
                      return Center(
                        child: Text(
                          "No Data Found",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }

                    if(state.courseDetailsApiStatus.isFailure) {
                       return Center(
                        child: Text(
                          "Failed to load Data!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }

                    final courseDetails = state.courseDetails;
                    return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: courseDetails!.modules?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: CourseMaterialCard(
                            index: index + 1,
                            learningModule: courseDetails.modules![index],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
