import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nba_flutter_app/learn/data/repository/learn_repository_impl.dart';
import 'package:nba_flutter_app/learn/domain/learn_repository.dart';
import 'package:nba_flutter_app/learn/models/learning_course.dart';
import 'package:nba_flutter_app/learn/models/learning_data_summary.dart';
import 'package:nba_flutter_app/learn/models/learning_response.dart';
import 'package:nba_flutter_app/learn/view/utils/learning_util.dart';
import 'package:nba_flutter_app/utils/api_status.dart';

part 'learn_state.dart';

class LearnCubit extends Cubit<LearnState> {
  LearnCubit() : super(LearnState());

  final LearningRepository _learningRepository = LearnRepositoryImpl();

  void getLearningData() async {
    try {
      emit(state.copyWith(courseApiStatus: ApiStatus.loading));
      
      final LearningResponse learningResponse = await _learningRepository.getAllCourses();

      emit(state.copyWith(
        learningDataSummary: learningResponse.data?.summary,
        expiringSoonCourses: LearningUtils.getExpiringSoonCourses(learningResponse.data?.courses ?? []),
        completedCourses: LearningUtils.getCompletedCourses(learningResponse.data?.courses ?? []),
        onGoingCourses: LearningUtils.getInProgressCourses(learningResponse.data?.courses ?? []),
        yetToStartCourses: LearningUtils.getYetToStartCourse(learningResponse.data?.courses ?? []),
        courseApiStatus: ApiStatus.success,
      ));
    } catch(e) {
      print(e);
    }
  }
}
