import 'package:hydrated_bloc/hydrated_bloc.dart';

class AppState extends HydratedCubit<String> {
  AppState() : super("");

  @override
  String fromJson(Map<String, dynamic> json) => json['appstate'];

  @override
  Map<String, String> toJson(String state) => {'appstate': state};
}
