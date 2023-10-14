import 'package:covid_tracker/models/WordStateModel.dart';
import 'package:covid_tracker/services/world_state_service.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'countries_list.dart';

class WordStatus extends StatefulWidget {
  const WordStatus({Key? key});

  @override
  State<WordStatus> createState() => _WordStatusState();
}

class _WordStatusState extends State<WordStatus> with TickerProviderStateMixin {
  WorldStateService worldStateService = WorldStateService();
  late final AnimationController animationController =
  AnimationController(vsync: this, duration: const Duration(seconds: 3))
    ..repeat();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: -80,
              right: -80,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightGreenAccent.withOpacity(0.1),
                      Colors.lightGreen.withOpacity(0.1),
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                  shape: BoxShape.circle,
                  color: Colors.lightGreenAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightGreenAccent.withOpacity(0.5),
                      blurRadius: 100,
                      spreadRadius: 100,
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder(
              future: worldStateService.worldStateFunction(),
              builder: (context, AsyncSnapshot<WordStateModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Expanded(
                    flex: 1,
                    child: SpinKitFadingCircle(
                      color: Colors.lightGreenAccent,
                      size: 50.0,
                      controller: animationController,
                    ),
                  );
                } else if (snapshot.hasError) {
                  print("Error");
                  return const Text("Error occurred"); // Display an error message.
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Stay Home Be Safe",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'Poppins',
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        PieChart(
                          colorList: const [Colors.blue, Colors.green, Colors.red],
                          chartRadius: 150,
                          animationDuration: const Duration(seconds: 3),
                          chartType: ChartType.ring,
                          legendOptions: const LegendOptions(
                            legendShape: BoxShape.circle,
                            legendPosition: LegendPosition.left,
                          ),
                          dataMap: {
                            'Total': double.parse(snapshot.data!.cases.toString()),
                            'Recovered': double.parse(snapshot.data!.recovered.toString()),
                            'Death': double.parse(snapshot.data!.deaths.toString()),
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          color: Colors.greenAccent,
                          child: ShowDetailsComponent(
                            title: 'Total',
                            value: snapshot.data!.cases.toString(),
                          ),
                        ),
                        Card(
                          color: Colors.greenAccent,
                          child: ShowDetailsComponent(
                            title: 'Death',
                            value: snapshot.data!.deaths.toString(),
                          ),
                        ),
                        Card(
                          color: Colors.greenAccent,
                          child: ShowDetailsComponent(
                            title: 'Recovered',
                            value: snapshot.data!.recovered.toString(),
                          ),
                        ),
                        Card(
                          color: Colors.greenAccent,
                          child: ShowDetailsComponent(
                            title: 'Critical',
                            value: snapshot.data!.critical.toString(),
                          ),
                        ),
                        Card(
                          color: Colors.greenAccent,
                          child: ShowDetailsComponent(
                            title: 'Today Deaths',
                            value: snapshot.data!.todayDeaths.toString(),
                          ),
                        ),
                        Card(
                          color: Colors.greenAccent,
                          child: ShowDetailsComponent(
                            title: 'Today Recovered',
                            value: snapshot.data!.todayRecovered.toString(),
                          ),
                        ),


                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CountriesList(),));
                          },
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            child: const Center(
                              child: Text(
                                'Look country ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ShowDetailsComponent extends StatefulWidget {
  final String title;
  final String value;
  const ShowDetailsComponent({Key? key, required this.title, required this.value});

  @override
  State<ShowDetailsComponent> createState() => _ShowDetailsComponentState();
}

class _ShowDetailsComponentState extends State<ShowDetailsComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title.toString(),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                widget.value.toString(),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
