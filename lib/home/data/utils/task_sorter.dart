import 'package:nba_flutter_app/home/data/models/task_item.dart';

/// Interface for task sorting strategies
abstract class TaskSortingStrategy {
  int compare(TaskItem a, TaskItem b);
}

/// Concrete implementation for priority-based sorting
class PriorityBasedSortingStrategy implements TaskSortingStrategy {
  @override
  int compare(TaskItem a, TaskItem b) {
    final priorityA = _getPriorityValue(a.priorityLevel);
    final priorityB = _getPriorityValue(b.priorityLevel);
    
    if (priorityA != priorityB) {
      return priorityA.compareTo(priorityB);
    }
    
    return int.parse(a.priorityOrder).compareTo(int.parse(b.priorityOrder));
  }

  int _getPriorityValue(PriorityLevel priorityLevel) {
    switch (priorityLevel) {
      case PriorityLevel.high:
        return 1;
      case PriorityLevel.medium:
        return 2;
      case PriorityLevel.low:
        return 3;
    }
  }
}

/// TaskSorter class that follows Single Responsibility Principle
class TaskSorter {
  final TaskSortingStrategy _strategy;

  /// Creates a TaskSorter with the specified sorting strategy
  TaskSorter({TaskSortingStrategy? strategy}) 
      : _strategy = strategy ?? PriorityBasedSortingStrategy();

  /// Sorts the list of tasks using the configured strategy
  List<TaskItem> sort(List<TaskItem> tasks) {
    return List<TaskItem>.from(tasks)..sort(_strategy.compare);
  }
} 