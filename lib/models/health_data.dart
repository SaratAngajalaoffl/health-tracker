import 'package:tracker/helpers/date_helpers.dart';
import 'package:tracker/models/single_day_health_data.dart';

class HealthData {
  Map<DateTime, SingleDayHealthData> data;

  HealthData({required this.data});
}
