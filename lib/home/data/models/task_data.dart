import 'package:dart_mappable/dart_mappable.dart';
import 'task_item.dart';

part 'task_data.mapper.dart';

@MappableClass()
class TaskData with TaskDataMappable {

  @MappableField(key: 'items')
  final List<TaskItem>? items;
  @MappableField(key: 'total')
  final int total;
  @MappableField(key: 'size')
  final int size;

  const TaskData({
    this.items,
    required this.total,
    required this.size,
  });

  int get getTotalTaskCount {
    if(items == null) return 0;
    return items?.length ?? 0;
  }

  int get totalPendingTaskCount {
    if(items == null) return 0;
    int count = 0;
    for(int index=0;index<items!.length; index++) {
      if(items![index].finalStatus.toLowerCase().contains('completing')) {
        count++;
      }
    }

    return count;
  }

}
