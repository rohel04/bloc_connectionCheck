
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_internetcheck/internet_bloc/internet_event.dart';
import 'package:bloc_internetcheck/internet_bloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';


class InternetBloc extends Bloc<InternetEvent, InternetState> {

  Connectivity _connectivity=Connectivity();
  StreamSubscription? connectionStream;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetGainedEvent>((event,emit)=>emit(InternetGainedState()));
    on<InternetLostEvent>((event,emit)=>emit(InternetLostState()));

    connectionStream=_connectivity.onConnectivityChanged.listen((event) {
      if(event==ConnectivityResult.mobile || event==ConnectivityResult.wifi){
        add(InternetGainedEvent());
      }
      else
        {
          add(InternetLostEvent());
        }
    });

  }
    @override
  Future<void> close() {
    connectionStream?.cancel();
    return super.close();
  }
}
