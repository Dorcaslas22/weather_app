import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

// part of 'weather_bloc_bloc.dart';

sealed class WeatherBlocEvent extends Equatable{
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];

}

class FetchWeather extends WeatherBlocEvent{
  final Position position;

  FetchWeather(this.position);

  @override
  List<Object> get props => [position];

}