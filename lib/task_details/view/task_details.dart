import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nba_flutter_app/home/data/models/task_item.dart';
import 'package:nba_flutter_app/home/view/cubit/home_cubit.dart';
import 'package:nba_flutter_app/home/view/cubit/home_state.dart';
import 'package:nba_flutter_app/task_details/widgets/task_detail_body.dart';
import 'package:nba_flutter_app/task_details/widgets/task_detail_header.dart';
import 'package:nba_flutter_app/task_details/widgets/take_action_btn.dart';
import 'package:nba_flutter_app/task_details/widgets/take_action_sheet.dart';
import 'package:nba_flutter_app/task_details/widgets/task_details_shimmer.dart';
import 'package:nba_flutter_app/task_details/widgets/task_comments_section.dart';
import 'package:intl/intl.dart';
import 'package:nba_flutter_app/utils/api_status.dart';

class TaskDetailsView extends StatefulWidget {
  const TaskDetailsView({
    super.key,
    required this.taskItem,
  });

  final TaskItem taskItem;

  @override
  State<TaskDetailsView> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTaskDetails(
      sourceId: widget.taskItem.taskSourceId,
      type: widget.taskItem.taskName
    );
  }

  void _openTakeActionSheet() {
    showModalBottomSheet(
      context: context,
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              ),
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        return SizedBox(
          width: width * 0.8,
          child: TakeActionSheet()
        );
      },
    );
  }
  
  String _formatDate(String? isoDate) {
    if (isoDate == null) {
      return '';
    }
    final date = DateTime.parse(isoDate);
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff09161C),
      appBar: AppBar(
        backgroundColor: Color(0xff0F172A),
        title: Text(
          widget.taskItem.taskAppBarTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: TakeActionBtn(
          title: 'Take Action (3)',
          onPressed: _openTakeActionSheet,
        )
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.taskDetailsApiStatus == ApiStatus.loading) {
            return const TaskDetailsShimmer();
          }

          if (state.taskDetailsApiStatus == ApiStatus.failure) {
            return const Center(
              child: Text(
                'Failed to load task details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }

          final String clientName = state.taskDetails?.data.fullName ?? '';
          final String clientMobileNo = state.taskDetails?.data.mobileNo ?? '';
          final String? clientAge = state.taskDetails?.data.age?.toString();
          final String clientEmailId = state.taskDetails?.data.emailId ?? '';
          return Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                TaskDetailsHeader(
                  from: _formatDate(widget.taskItem.startDate),
                  to: _formatDate(widget.taskItem.endDate),
                ),
                SizedBox(height: 15,),
                TaskDetailsBody(
                  heading: widget.taskItem.taskHeading(clientName),
                  subheading: widget.taskItem.taskSubheading(clientName),
                  clientName: clientName,
                  clientPhoneNo: "+91 $clientMobileNo",
                  isBirthdayTask: widget.taskItem.isBirthdayTask,
                  clientAge: clientAge,
                  clientEmailId: clientEmailId,
                ),
                const TaskCommentsSection(),
              ],
            ),
          );
        },
      ),
    );
  }
}