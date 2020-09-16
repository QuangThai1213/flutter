import 'package:cowell/Model/user.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:cowell/Model/app_state.dart';

class AppStateCubit extends HydratedCubit<AppState> {
  AppStateCubit() : super(AppState(isLogin: false));

  void login() {
    state.user = User(name: "thai");
    state.isLogin = true;
    emit(state);
  }

  void logout() {
    state.user = null;
    state.isLogin = false;
    emit(state);
  }

  getData() => state.isLogin;
  @override
  AppState fromJson(Map<String, dynamic> json) => AppState.fromJson(json);

  @override
  Map<String, dynamic> toJson(AppState state) => {
        'isLogin': state.isLogin,
      };
}
