import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_flutter_app/home/data/models/hooks/priority_level.dart';
import 'package:nba_flutter_app/home/data/models/hooks/task_date_hook.dart';

part 'task_item.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum PriorityLevel { high, medium, low }

@MappableClass()
class TaskItem with TaskItemMappable {

  @MappableField(key: 'taskName')
  final String taskName;
  @MappableField(key: 'taskDescription')
  final String taskDescription;
  @MappableField(key: 'startDate',)
  final String? startDate;
  @MappableField(key: 'endDate',)
  final String? endDate;
  @MappableField(key: 'dueDate',)
  final String? dueDate;
  @MappableField(key: 'priorityLevel', hook: PriorityLevelHook())
  final PriorityLevel priorityLevel;
  @MappableField(key: 'priorityOrder')
  final String priorityOrder;
  @MappableField(key: 'taskSourceId')
  final String taskSourceId;
  @MappableField(key: 'finalStatus')
  final String finalStatus;
  @MappableField(key: 'lob')
  final String? lob;
  @MappableField(key: 'customerName')
  final String? customerName; 

  TaskItem({
    required this.taskName,
    required this.taskDescription,
    this.startDate,
    this.endDate,
    this.dueDate,
    required this.priorityLevel,
    required this.priorityOrder,
    required this.taskSourceId,
    required this.finalStatus,
    this.customerName,
    this.lob,
  });


  bool get isBirthdayTask {
    if(taskName.toLowerCase().contains('birthday')) {
      return true;
    }

    return false;
  }

  bool get isCrossSellTask {
    if(taskName.toLowerCase().contains('cross')) {
      return true;
    }
    return false;
  }

  String taskHeading(String name) {
    if (isBirthdayTask) {
      return "Don’t miss the chance to wish $name a happy birthday!";
    } else if (isCrossSellTask) {
      return "New Cross Sell Opportunity to $name";
    } else {
      return "Don’t miss an opportunity to connect with $name!";
    }
  }

   String taskSubheading(String name) {
    if (isBirthdayTask) {
      return "It's important to communicate with clients on special occasions";
    } else if (isCrossSellTask) {
      return "With the recent product that has been purchased by $name yesterday, we feel this product can be a perfect additional buy.";
    } else {
      return "Don’t miss an opportunity to connect with clients!";
    }
  }

  String get taskAppBarTitle {
    if (isBirthdayTask) {
      return "Birthday Greetings";
    } else if (isCrossSellTask) {
      return "Up-sell / Cross-sell";
    } else {
      return "Task Details";
    }
  }


}