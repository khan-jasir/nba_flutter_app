import 'package:dart_mappable/dart_mappable.dart';
import 'package:nba_flutter_app/home/data/models/hooks/priority_level.dart';
import 'package:nba_flutter_app/home/data/models/hooks/task_date_hook.dart';
import 'package:nba_flutter_app/home/widgets/task_priority.dart';

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

  bool get isTrainingTask {
    if(taskName.toLowerCase().contains('training')) {
      return true;
    }
    return false;
  }

  String taskHeading(String name) {
    if (isBirthdayTask) {
      return "Don't miss the chance to wish $name a happy birthday!";
    } else if (isCrossSellTask) {
      return "New Cross Sell Opportunity to $name";
    } else {
      return "Don't miss an opportunity to connect with $name!";
    }
  }

  String taskSubheading(String name) {
    if (isBirthdayTask) {
      return "It's important to communicate with clients on special occasions";
    } else if (isCrossSellTask) {
      return "With the recent product that has been purchased by $name yesterday, we feel this product can be a perfect additional buy.";
    } else {
      return "Don't miss an opportunity to connect with clients!";
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

  // Create a factory constructor to group tasks by status
  static Map<String, List<TaskItem>> groupByStatus(List<TaskItem> tasks) {
    return tasks.fold<Map<String, List<TaskItem>>>(
      {},
      (map, task) {
        if (!map.containsKey(task.finalStatus)) {
          map[task.finalStatus] = [];
        }
        map[task.finalStatus]!.add(task);
        return map;
      },
    );
  }

  // Group tasks by their type (birthday, cross-sell, training)
  static Map<String, List<TaskItem>> groupByType(List<TaskItem> tasks) {
    return tasks.fold<Map<String, List<TaskItem>>>(
      {},
      (map, task) {
        String taskType;
        if (task.isBirthdayTask) {
          taskType = 'Birthday Tasks';
        } else if (task.isCrossSellTask) {
          taskType = 'Cross-Sell Opportunities';
        } else if (task.isTrainingTask) {
          taskType = 'Training Tasks';
        } else {
          taskType = 'Other Tasks';
        }

        if (!map.containsKey(taskType)) {
          map[taskType] = [];
        }
        map[taskType]!.add(task);
        return map;
      },
    );
  }

  // Get the display title for a task type
  static String getTaskTypeTitle(String taskType, int taskCount) {
    switch (taskType) {
      case 'Birthday Tasks':
        return 'Birthday Wishes (X$taskCount)';
      case 'Cross-Sell Opportunities':
        return 'Cross-Sell Opportunities (X$taskCount)';
      case 'Training Tasks':
        return 'Training Activities (X$taskCount)';
      default:
        return 'Other Tasks';
    }
  }

  // Factory constructor for creating a birthday task
  factory TaskItem.birthday({
    required String clientName,
    required String assignedDate,
    required String status,
  }) {
    return TaskItem(
      taskName: "Birthday Wish",
      taskDescription: "Don't miss the chance to wish $clientName a happy birthday!",
      priorityLevel: PriorityLevel.high,
      priorityOrder: "1",
      taskSourceId: "BIRTHDAY_${DateTime.now().millisecondsSinceEpoch}",
      lob: "Birthday",
      customerName: clientName,
      finalStatus: status,
      startDate: assignedDate,
    );
  }

  // Factory constructor for creating a regular task
  factory TaskItem.regular({
    required String title,
    required String description,
    required PriorityLevel priorityLevel,
    required String lob,
    required String clientName,
    required String assignedDate,
    required String status,
  }) {
    return TaskItem(
      taskName: title,
      taskDescription: description,
      priorityLevel: priorityLevel,
      priorityOrder: priorityLevel == PriorityLevel.high ? "1" : 
                    priorityLevel == PriorityLevel.medium ? "2" : "3",
      taskSourceId: "TASK_${DateTime.now().millisecondsSinceEpoch}",
      lob: lob,
      customerName: clientName,
      finalStatus: status,
      startDate: assignedDate,
    );
  }
}