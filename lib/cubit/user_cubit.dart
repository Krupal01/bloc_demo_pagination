import 'package:bloc/bloc.dart';
import 'package:bloc_demo_pagination/cubit_state/user_state.dart';
import 'package:bloc_demo_pagination/network/api_interface.dart';

class UserCubit extends Cubit<UserState> {
  final ApiInterface apiInterface;

  UserCubit({required this.apiInterface}) : super(InitUserState());

  Future<void> fatchUsers(int page) async {
    emit(LoadingUserState());

    try {
      final response = await apiInterface.getAllUser(page);
      emit(FatchUserState(response));
    } catch (e) {
      emit(ErrorUserState(e.toString()));
    }
  }
}
