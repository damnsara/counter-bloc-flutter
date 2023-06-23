import 'package:bloc_practice2/pages/application/bloc/application_events.dart';
import 'package:bloc_practice2/pages/application/bloc/application_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState>{
  AppBloc():super(const AppState()){
    on<TriggerAppEvent>((event, emit){
      emit(AppState(index: event.index));
    });
  }
}