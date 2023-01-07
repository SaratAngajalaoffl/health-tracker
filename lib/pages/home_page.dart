import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tracker/helpers/date_helpers.dart';
import 'package:tracker/models/health_data.dart';
import 'package:tracker/models/single_day_health_data.dart';
import 'package:tracker/notifiers/data_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(taskProvider).data;

    var today = getToday();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Row(children: [
          data.containsKey(today)
              ? const Text("Data already added")
              : MaterialButton(
                  onPressed: () => ref.read(taskProvider.notifier).add(
                        SingleDayHealthData(
                          date: getToday(),
                          frontPicture: "",
                          backPicture: "",
                          weight: 74,
                        ),
                      ),
                  child: const Text("Add Data"),
                )
        ]),
      ),
    );
  }
}
