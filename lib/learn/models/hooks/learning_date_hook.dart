import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart';

class LearningDateHook extends MappingHook {
  const LearningDateHook();

  @override
  Object? beforeDecode(Object? value) {
    try {
      final DateFormat format = DateFormat('yyyy-mm-dd hh:mm:ss');
      if (value is String) {
        final output = format.parse(value);
        return DateFormat('dd-MMM-yy').format(output);
      } else {
        return value;
      }
    } catch (e) {
      return null;
    }
  }
}
