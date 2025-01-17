import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/bloc/weather_event.dart';

import '../data/my_data.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory(apiKey!, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure());
      }
    });
  }
}
