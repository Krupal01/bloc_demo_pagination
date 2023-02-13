import 'package:bloc_demo_pagination/model/user_model.dart';

abstract class UserState {
}

class InitUserState extends UserState {
  
}

class FatchUserState extends UserState {
  final List<User> userList;

  FatchUserState(this.userList);
}

class ErrorUserState extends UserState {
  final String msg;
  ErrorUserState(this.msg);
}

class LoadingUserState extends UserState {}
