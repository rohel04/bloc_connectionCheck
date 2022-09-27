abstract class InternetState {}

class InternetInitialState extends InternetState {}

class InternetGainedState extends InternetState {
  String Gainedstatus = 'Internet Connected';
}

class InternetLostState extends InternetState {
  String Loststatus = 'Connection Lost';
}
