import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nba_flutter_app/learn/models/learning_course.dart';
import 'package:nba_flutter_app/learn/models/learning_data.dart';
import 'package:nba_flutter_app/learn/models/learning_data_summary.dart';
import 'package:nba_flutter_app/learn/models/learning_record.dart';
import 'package:nba_flutter_app/learn/view/cubit/learing_dummy_data.dart';
import 'package:nba_flutter_app/learn/view/utils/learning_util.dart';
import 'package:nba_flutter_app/utils/api_status.dart';

part 'learn_state.dart';

class LearnCubit extends Cubit<LearnState> {
  LearnCubit() : super(LearnState());

  void getLearningData() async {
    try {
      emit(state.copyWith(courseApiStatus: ApiStatus.loading));
      final LearningRecord learningRecord = LearningRecordMapper.fromMap(learningDummyData);
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(
        learningDataSummary: learningRecord.learningData.summary,
        expiringSoonCourses: LearningUtils.getExpiringSoonCourses(learningRecord.learningData.courses),
        completedCourses: LearningUtils.getCompletedCourses(learningRecord.learningData.courses),
        onGoingCourses: LearningUtils.getInProgressCourses(learningRecord.learningData.courses),
        yetToStartCourses: LearningUtils.getYetToStartCourse(learningRecord.learningData.courses),
        courseApiStatus: ApiStatus.success,
      ));
    } catch(e) {
      print(e);
    }
  }
}
