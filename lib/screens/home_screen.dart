import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';

import '../bloc/weather_bloc_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

Widget getWeatherIcon(int code){
  switch(code){
    case >=200 && <300:
      return Image.asset("assets/thunderstorm.png"
  );
    case >=400 && <500:
      return Image.asset("assets/drizzle.png"
      );
    case >=600 && <700:
      return Image.asset("assets/rain.png"
      );
    case >=700 && <800:
      return Image.asset("assets/snow.png"
      );
    case ==800:
      return Image.asset("assets/atmosphere.png"
      );
    case >800 && <=804:
      return Image.asset("assets/clear.png"
      );

    default:
  return Image.asset("assets/clouds.png"
  );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body:  Padding(padding:
      EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.2),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 150,sigmaY: 150),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent
                  ),
                ),
              ),
              BlocBuilder<WeatherBlocBloc,WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocSuccess) {
                    return SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            "${state.weather.areaName}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          const Text("Good Morning Dorcas,",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          getWeatherIcon(state.weather.weatherConditionCode!),
                          Center(
                            child: Text(
                              "${state.weather.temperature!.celsius!.round()}C",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 55,
                              ),
                            ),
                          ),
                           Center(
                            child: Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                           Center(
                            child: Text(
                              DateFormat('EEEE dd.').add_jm().format(state.weather.date!),
                              // "Monday 28,13:32PM",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/sun.png",
                                    scale: 8,
                                  ),
                                  SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("Sunrise",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        DateFormat().add_jm().format(state.weather.sunrise!),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/rain.png",
                                    scale: 8,
                                  ),
                                  SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("Rainy Day",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        DateFormat().add_jm().format(state.weather.rainLastHour as DateTime),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 5),
                            child: Divider(
                              color: Colors.blueGrey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/hot.png",
                                    scale: 8,
                                  ),
                                  SizedBox(width: 5),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("Temp Max",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                       "${state.weather.tempMax!.celsius!.round().toString()}C",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/fahrenheit.png",
                                    scale: 8,
                                  ),
                                  SizedBox(width: 5),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("Temp Min",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "${state.weather.tempMin!.celsius!.round().toString()}C",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }else{
                    return Container();
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
