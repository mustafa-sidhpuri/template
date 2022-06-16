import 'package:equatable/equatable.dart';

import 'constants.dart';

abstract class InternetState extends Equatable{}

class InternetLoading extends InternetState{
  @override
  List<Object?> get props => [];
}

class InternetConnected extends InternetState{
  final ConnectionType connectionType;

  InternetConnected({required this.connectionType});

  @override
  List<Object?> get props => [connectionType];
}

class InternetDisconnected extends InternetState{
  @override
  List<Object?> get props => [];
}
