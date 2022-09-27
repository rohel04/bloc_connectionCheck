abstract class InternetState {}

class InternetInitialState extends InternetState {}

class InternetGainedState extends InternetState {
  String status = 'Internet Connected';
}

class InternetLostState extends InternetState {
  String status = 'Connection Lost';
}
