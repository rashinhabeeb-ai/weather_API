import 'package:apiweatherapp/data/image_path.dart';
import 'package:apiweatherapp/servieces/location_provider.dart';
import 'package:apiweatherapp/utils/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Provider.of<LocationProvider>(context,listen: false).determinePosition();
    super.initState();
  }

  bool _click = false;
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 30, bottom: 20, right: 20),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(background[1]),
          ),
        ),
        child: Stack(
          children: [
         if(_click)   Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Container(height: 40,
                  child: TextFormField(
                    decoration:InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white
                        )
                      )

                    ) ,
                  )),
            ),

            Container(
              height: 50,
              child: Consumer<LocationProvider>(
                builder: (context, locationProvider, child) {
                  return  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.location_pin, color: Colors.red),
                            SizedBox(width: 10),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // AppText(
                                //   data: locationProvider.currentLocationName!.locality,
                                //   color: Colors.white,
                                //   fw: FontWeight.w700,
                                //   size: 18,
                                // ),
                                AppText(
                                  data: 'Good Morning',
                                  color: Colors.white,
                                  fw: FontWeight.w700,
                                  size: 14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            _click =! _click;
                          });
                        },
                        icon: Icon(Icons.search, size: 32),
                      ),
                    ],
                  );
                }


              ),
            ),


            if(!_click) ...[
          Align(
              alignment: Alignment(0, -0.7),
              child: SvgPicture.asset(
                imagePath[4],
                color: Colors.white,
                height: 150,
              ),
            ),

       Align(
              alignment: Alignment(0, 0),
              child: Container(
                height: 130,
                width: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                      data: '22°C',
                      color: Colors.white,
                      fw: FontWeight.bold,
                      size: 30,
                    ),
                    AppText(
                      data: 'Snow',
                      color: Colors.white,
                      fw: FontWeight.w600,
                      size: 26,
                    ),

                    // AppText(data: DateTime.now().toString(),color: Colors.white,)
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment(0.0, 0.75),
              child: Container(
                height: 180,
                color: Colors.black.withOpacity(0.4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/img/conditions/temp_max.svg',
                              height: 45,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data: 'Temp Max',
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                                AppText(
                                  data: '22°C',
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/img/conditions/temp_min.svg',
                              height: 45,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data: 'Temp Min',
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                                AppText(
                                  data: '22°C',
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.white,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                'assets/img/conditions/sun-svgrepo-com.svg',
                                height: 30,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data: 'Sunrise',
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                                AppText(
                                  data: '22°C',
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 30),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                'assets/img/conditions/moon-svgrepo-com.svg',
                                height: 30,
                                color: Colors.blueAccent,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data: 'Sunset',
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                                AppText(
                                  data: '22°C',
                                  color: Colors.white,
                                  size: 14,
                                  fw: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ]
          ],
        ),
      ),
    );
  }
}
