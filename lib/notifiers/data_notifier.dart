import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tracker/helpers/date_helpers.dart';
import 'package:tracker/models/health_data.dart';
import 'package:tracker/models/single_day_health_data.dart';

class DataNotifier extends StateNotifier<HealthData> {
  DataNotifier({data}) : super(data);

  void add(SingleDayHealthData healthData) {
    DateTime date = getToday();

    if (state.data.containsKey(date)) throw Exception('Data already exists');

    var newState = HealthData(
      data: <DateTime, SingleDayHealthData>{
        ...state.data,
        date: healthData,
      },
    );

    state = newState;
  }

  void remove(DateTime date) {
    throw Exception('Cannot remove data');
  }
}

final taskProvider = StateNotifierProvider<DataNotifier, HealthData>(((ref) {
  return DataNotifier(
    data: HealthData(
      data: <DateTime, SingleDayHealthData>{},
    ),
  );
}));
