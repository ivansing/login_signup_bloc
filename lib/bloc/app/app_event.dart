part of 'app_bloc.dart';

/* AppUserChanged which notifies the bloc that the current user has changed.
AppLogoutRequested which notifies the bloc that the current user has requested to be logged out. */

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AppEvent {}

class AppUserChanged extends AppEvent {
  
  const AppUserChanged(this.user);

  final User user;

   @override
  List<Object> get props => [user];
}

