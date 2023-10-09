import 'dart:math';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/utils/context_extension.dart';
import 'package:bite_trace/utils/date_time_extension.dart';
import 'package:bite_trace/utils/num_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

@RoutePage()
class MeasurementsScreen extends ConsumerStatefulWidget {
  const MeasurementsScreen({super.key});

  @override
  ConsumerState<MeasurementsScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends ConsumerState<MeasurementsScreen>
    with SingleTickerProviderStateMixin {
  Measurements? measurements;
  String? uid;
  List<MeasurementEntry>? entries;
  late final Future<void> initDone;
  late final TabController _tabController;
  int idx = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        idx = _tabController.index;
      });
    });
    initDone = init();
    super.initState();
  }

  Future<void> init() async {
    uid = (await ref.read(authServiceProvider).getCurrentUser())!.userId;
    final m =
        await ref.read(measurementsServiceProvider).getMeasurements(uid!) ??
            Measurements(id: uid);
    setState(() {
      measurements = m;
    });
  }

  Measurements? get m => measurements;

  void update(Measurements newMeasurements) {
    ref.read(measurementsServiceProvider).updateMeasurements(newMeasurements);
    setState(() {
      measurements = newMeasurements;
    });
  }

  TextStyle _tabTextStyle(BuildContext context, bool selected) {
    return TextStyle(
      color: selected ? Theme.of(context).primaryColor : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Measure'),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(
                  child: Text(
                    'Weight',
                    style: _tabTextStyle(
                      context,
                      idx == 0,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Size',
                    style: _tabTextStyle(
                      context,
                      idx == 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              GraphAndEntries(
                colors: [
                  Theme.of(context).primaryColor,
                ],
                labels: const ['Weight'],
                unit: 'kg',
                input: [m?.weight ?? []],
                onUpdate: (entries) async {
                  await initDone;
                  final weight = entries[0];
                  final newM = m!.copyWith(weight: weight);
                  update(newM);
                },
              ),
              GraphAndEntries(
                colors: [
                  context.appColors.carbColor,
                  context.appColors.fatColor,
                  context.appColors.proteinColor,
                ],
                labels: const ['Chest', 'Waist', 'Thighs'],
                unit: 'cm',
                input: [m?.chest ?? [], m?.waist ?? [], m?.thighs ?? []],
                onUpdate: (entries) async {
                  await initDone;
                  final newM = m!.copyWith(
                    chest: entries[0],
                    waist: entries[1],
                    thighs: entries[2],
                  );
                  update(newM);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class GraphAndEntries extends StatelessWidget {
  const GraphAndEntries({
    super.key,
    required this.input,
    required this.onUpdate,
    required this.labels,
    required this.unit,
    required this.colors,
  });

  final List<List<MeasurementEntry>> input;
  final List<String> labels;
  final String unit;
  final List<Color> colors;
  final void Function(List<List<MeasurementEntry>?>) onUpdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(child: _buildChart(context)),
        Expanded(child: Card(child: _buildEntryList(context))),
        IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(10, 10),
          ),
          onPressed: () async {
            final res = await _showAddEntryDialog(context);
            if (res != null) {
              final entries = _updateInput(res);
              onUpdate(entries);
            }
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  List<List<MeasurementEntry>> _updateInput(List<MeasurementEntry?> res) {
    final entries = <List<MeasurementEntry>>[
      for (int i = 0; i < input.length; i++) [],
    ];
    for (int i = 0; i < input.length; i++) {
      bool addedNew = false;
      for (int j = 0; j < input[i].length; j++) {
        if (input[i][j].date == res[i]?.date) {
          entries[i].add(res[i]!);
          addedNew = true;
        } else {
          entries[i].add(input[i][j]);
        }
      }
      if (!addedNew) {
        entries[i].add(res[i]!);
      }
      entries[i].sort((a, b) => a.date.compareTo(b.date));
    }
    return entries;
  }

  Widget _buildEntryList(BuildContext context) {
    final length = input
        .map(
          (e) => e.length,
        )
        .reduce(
          (value, element) => max(value, element),
        );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 10,
          ),
          for (int i = 0; i < length; i++)
            _buildEntry(
              context,
              [for (final list in input) i >= list.length ? null : list[i]],
            ),
        ],
      ),
    );
  }

  Widget _buildEntry(BuildContext context, List<MeasurementEntry?> entry) {
    if (entry.where((element) => element != null).isEmpty) return Container();

    Widget title =
        Text('${entry.first!.value.toStringWithoutTrailingZeros()} $unit');

    if (entry.length > 1) {
      title = RichText(
        text: TextSpan(
          children: [
            ...entry
                .where((element) => element != null)
                .map(
                  (e) => [
                    TextSpan(
                      text: '${labels[entry.indexOf(e)]}: ',
                      style: const TextStyle(),
                    ),
                    TextSpan(
                      text: '${e!.value.toStringWithoutTrailingZeros()}$unit  ',
                      style: TextStyle(
                        color: colors[entry.indexOf(e)],
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
                .expand((element) => element),
          ],
        ),
      );
    }

    return ListTile(
      title: title,
      onTap: () async {
        final res = await _showAddEntryDialog(context, initial: entry);
        if (res != null) {
          final entries = _updateInput(res);
          onUpdate(entries);
        }
      },
      subtitle: Text(
        entry
            .where((element) => element != null)
            .first!
            .date
            .getDateTime()
            .dateForCalendar(),
      ),
    );
  }

  Widget _buildChart(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (input.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                for (int i = 0; i < input.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: colors[i],
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(labels[i]),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        const SizedBox(
          height: 6,
        ),
        Container(
          margin: const EdgeInsets.all(12.0),
          height: 200,
          alignment: Alignment.center,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(),
                rightTitles: const AxisTitles(),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 24 * 60 * 60,
                    getTitlesWidget: (value, meta) {
                      return SideTitleWidget(
                        axisSide: AxisSide.bottom,
                        angle: 0.6,
                        child: Text(
                          DateFormat.Md().format(
                            DateTime.fromMillisecondsSinceEpoch(
                              (value * 1000).toInt(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              lineBarsData: [
                for (final entries in input.asMap().entries)
                  LineChartBarData(
                    color: input.length < 2
                        ? Theme.of(context).primaryColor
                        : [
                            context.appColors.carbColor,
                            context.appColors.fatColor,
                            context.appColors.proteinColor,
                          ][entries.key],
                    spots: entries.value
                        .map(
                          (e) => FlSpot(
                            e.date.getDateTime().millisecondsSinceEpoch / 1000,
                            e.value,
                          ),
                        )
                        .toList(),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<List<MeasurementEntry?>?> _showAddEntryDialog(
    BuildContext context, {
    List<MeasurementEntry?>? initial,
  }) {
    DateTime? selected =
        initial?.firstOrNull?.date.getDateTime() ?? DateTime.now();
    final List<double?> values = initial?.map((e) => e?.value).toList() ??
        List.filled(input.length, null);
    return showDialog<List<MeasurementEntry?>>(
      context: context,
      builder: (c) {
        final dateText =
            TextEditingController(text: selected?.dateForCalendar());
        return SimpleDialog(
          insetPadding: const EdgeInsets.all(20.0),
          title: const Text('Add/Edit entry'),
          contentPadding: const EdgeInsets.all(20),
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: c,
                    initialDate: selected ?? DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    final now = DateTime.now();
                    selected = picked.copyWith(
                      hour: now.hour,
                      minute: now.minute,
                      second: now.second,
                    );
                    dateText.text = DateFormat.yMd().format(selected!);
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    controller: dateText,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 14.0,
            ),
            for (int i = 0; i < values.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: TextEditingController(
                    text: values[i]?.toStringWithoutTrailingZeros(),
                  ),
                  decoration: InputDecoration(
                    labelText: labels[i],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  onChanged: (v) {
                    values[i] = double.tryParse(v);
                  },
                ),
              ),
            ElevatedButton(
              onPressed: () {
                dateText.dispose();
                if (selected == null ||
                    !values.any((element) => element != null)) {
                  context.popRoute();
                }
                context.popRoute(
                  values
                      .map(
                        (e) => e == null
                            ? null
                            : MeasurementEntry(
                                date: TemporalDate(selected!),
                                value: e,
                              ),
                      )
                      .toList(),
                );
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
