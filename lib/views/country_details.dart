import 'package:flutter/material.dart';

class CountryDetails extends StatefulWidget {
  String image;
  String name ;
  int totalCases, totalDeaths, totalRecovered, active, critical, todayRecovered, test;
   CountryDetails({super.key,required this.image,
  required this.todayRecovered,
  required this.critical,
  required this.active,
  required this.name,
  required this.test,
  required this.totalCases,
  required this.totalDeaths,
  required this.totalRecovered,
  });

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image: NetworkImage(widget.image),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SafeArea(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: IconButton(
                        icon: const Center(child: Icon(Icons.arrow_back_ios,color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                       child: Container(
                         width: double.infinity,
                         height: 50,
                         decoration: const BoxDecoration(
                           color: Colors.lightGreenAccent,
                           borderRadius: BorderRadius.all(Radius.circular(12),
                           )
                         ),
                       child:  Center(child: Text(widget.active.toString(),style: const TextStyle(fontSize: 20,fontFamily: 'Poppins',color: Colors.white,letterSpacing: 2,fontWeight: FontWeight.bold)),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.lightGreenAccent,
                            borderRadius: BorderRadius.all(Radius.circular(12),
                            )
                        ),
                        child:  Center(child: Text(widget.critical.toString(),style: const TextStyle(fontSize: 20,fontFamily: 'Poppins',color: Colors.white,letterSpacing: 2,fontWeight: FontWeight.bold)),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.lightGreenAccent,
                            borderRadius: BorderRadius.all(Radius.circular(12),
                            )
                        ),
                        child:  Center(child: Text(widget.todayRecovered.toString(),style: const TextStyle(fontSize: 20,fontFamily: 'Poppins',color: Colors.white,letterSpacing: 2,fontWeight: FontWeight.bold)),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.lightGreenAccent,
                            borderRadius: BorderRadius.all(Radius.circular(12),
                            )
                        ),
                        child:  Center(child: Text(widget.totalDeaths.toString(),style: const TextStyle(fontSize: 20,fontFamily: 'Poppins',color: Colors.white,letterSpacing: 2,fontWeight: FontWeight.bold)),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.lightGreenAccent,
                            borderRadius: BorderRadius.all(Radius.circular(12),
                            )
                        ),
                        child:  Center(child: Text(widget.test.toString(),style: const TextStyle(fontSize: 20,fontFamily: 'Poppins',color: Colors.white,letterSpacing: 2,fontWeight: FontWeight.bold)),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.lightGreenAccent,
                            borderRadius: BorderRadius.all(Radius.circular(12),
                            )
                        ),
                        child:  Center(child: Text(widget.totalRecovered.toString(),style: const TextStyle(fontSize: 20,fontFamily: 'Poppins',color: Colors.white,letterSpacing: 2,fontWeight: FontWeight.bold)),),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
