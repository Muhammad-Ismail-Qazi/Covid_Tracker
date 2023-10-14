import 'package:covid_tracker/services/countries_list_service.dart';
import 'package:covid_tracker/views/country_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList>
    with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  CountriesListService countriesListService = CountriesListService();
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                    icon: const Center(
                        child: Icon(Icons.arrow_back_ios, color: Colors.white)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: searchController,
                onChanged: (value) => setState(() {}),
                focusNode: _focusNode,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with country name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              Expanded(
                // Wrap ListView.builder with Expanded
                child: FutureBuilder(
                  future: countriesListService.countriesListFunction(),
                  builder: (context, snapshot) {
                    String name = '';
                    if (searchController.text.isEmpty) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: SpinKitFadingCircle(
                            color: Colors.lightGreenAccent,
                            size: 50.0,
                            controller: animationController,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else {
                        return ListView.builder(
                          itemCount: countriesListService.addCountries.length,
                          itemBuilder: (context, index) {
                            name = countriesListService
                                .addCountries[index].country
                                .toString();
                            return InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CountryDetails(
                                      image: countriesListService
                                          .addCountries[index].countryInfo!.flag
                                          .toString(),
                                      todayRecovered: countriesListService
                                          .addCountries[index].todayRecovered!.toInt(),
                                      critical: countriesListService
                                          .addCountries[index].critical!.toInt(),
                                      active: countriesListService
                                          .addCountries[index].active!.toInt(),
                                      name:countriesListService
                                          .addCountries[index].country
                                          .toString(),
                                      test: countriesListService
                                          .addCountries[index].tests!.toInt(),
                                      totalCases: countriesListService
                                          .addCountries[index].cases!.toInt(),
                                      totalDeaths: countriesListService
                                          .addCountries[index].deaths!.toInt(),
                                      totalRecovered: countriesListService
                                          .addCountries[index].recovered!.toInt(),
                                    ),
                                  )),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                title: Text(
                                  countriesListService
                                      .addCountries[index].country
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'Poppins'),
                                ),
                                subtitle: Text(
                                  "Population: ${countriesListService.addCountries[index].population.toString()}",
                                ),
                                leading: Image.network(
                                  countriesListService
                                      .addCountries[index].countryInfo!.flag
                                      .toString(),
                                  width:
                                      80, // Adjust the width of the flag image
                                ),
                              ),
                            );
                          },
                        );
                      }
                    } else if (name
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase())) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Shimmer(
                            gradient: LinearGradient(
                                colors: [Colors.lightGreenAccent.shade200]),
                            child: ListView.builder(
                              itemCount:
                                  countriesListService.addCountries.length,
                              itemBuilder: (context, index) {
                                name = countriesListService
                                    .addCountries[index].country
                                    .toString();
                                return ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  title: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  leading: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ));
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else {
                        return ListView.builder(
                          itemCount: countriesListService.addCountries.length,
                          itemBuilder: (context, index) {
                            name = countriesListService
                                .addCountries[index].country
                                .toString();
                            return ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              title: Text(
                                countriesListService.addCountries[index].country
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: 'Poppins'),
                              ),
                              subtitle: Text(
                                "Population: ${countriesListService.addCountries[index].population.toString()}",
                              ),
                              leading: Image.network(
                                countriesListService
                                    .addCountries[index].countryInfo!.flag
                                    .toString(),
                                width: 80, // Adjust the width of the flag image
                              ),
                            );
                          },
                        );
                      }
                    } else {
                      return Container();
                    }
                    return const Text("Your Data is Loading please patient ");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
