import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart';

class TaskDateHook extends MappingHook {
  const TaskDateHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value is String) {
      try {
        // Check if the date is already in the output format (dd-MMM-yy)
        final outputFormat = DateFormat('dd-MMM-yy');
        try {
          // If it can be parsed with output format, return as is
          outputFormat.parse(value);
          return value;
        } catch (_) {
          // If not, try parsing with input format
          final inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
          final date = inputFormat.parse(value);
          return outputFormat.format(date);
        }
      } catch (e) {
        print('Date parsing error: $e');
        return null;
      }
    }
    return value;
  }
} 