import 'package:dart_mappable/dart_mappable.dart';
import 'package:intl/intl.dart';

part 'task_details_data.mapper.dart';

@MappableClass()
class TaskDetailsData with TaskDetailsDataMappable {

  @MappableField(key: 'referredBy')
  final String? referredBy;

  @MappableField(key: 'title')
  final String? title;

  @MappableField(key: 'fullName')
  final String? fullName;

  @MappableField(key: 'emailId')
  final String? emailId;

  @MappableField(key: 'countryCode')
  final String? countryCode;

  @MappableField(key: 'mobileNo')
  final String? mobileNo;

  @MappableField(key: 'status')
  final bool? status;

  @MappableField(key: 'dob')
  final String? dob;

  @MappableField(key: 'gender') 
  final String? gender;

  @MappableField(key: 'lob')
  final String? lob;

  TaskDetailsData({
    this.referredBy,
    this.title,
    this.fullName,
    this.emailId,
    this.countryCode,
    this.mobileNo,
    this.status,
    this.dob,
    this.gender,
    this.lob,
  });

  int? get age {
    if (dob == null) return null;
    try {
      final birthDate = DateTime.parse(dob!);
      final today = DateTime.now();
      var age = today.year - birthDate.year;
      final monthDiff = today.month - birthDate.month;
      if (monthDiff < 0 || (monthDiff == 0 && today.day < birthDate.day)) {
        age--;
      }
      return age;
    } catch (e) {
      return null;
    }
  }
}