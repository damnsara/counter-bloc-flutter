import 'package:bloc_practice2/app_events.dart';
import 'package:bloc_practice2/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvents, AppStates>{
  AppBloc():super(InitStates()){
    print("app bloc");
    on<Increment>((event, emit){
      emit(AppStates(counter: state.counter+1));
    });

    on <Decrement>((event, emit){
      emit(AppStates(counter: state.counter-1));
    });
  }


}