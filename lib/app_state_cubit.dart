import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:cowell/Model/app_state.dart';

class AppStateCubit extends HydratedCubit<AppState> {
  AppStateCubit() : super(AppState(isLogin: false));

  void login() {
    AppState data = state;
    data.isLogin = true;
    emit(data);
  }

  void logout() {
    AppState data = state;
    data.isLogin = false;
    emit(data);
  }

  getData() => state.isLogin;
  @override
  AppState fromJson(Map<String, dynamic> json) => AppState.fromJson(json);

  @override
  Map<String, dynamic> toJson(AppState state) => {
        'isLogin': state.isLogin,
      };
}
