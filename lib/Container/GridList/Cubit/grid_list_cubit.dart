import 'package:hydrated_bloc/hydrated_bloc.dart';

class GridListCubit extends HydratedCubit<String> {
  /// {@macro counter_cubit}
  GridListCubit() : super("");

  /// Add 1 to the current state.
  void getRecent(recent) => emit(recent);

  @override
  String fromJson(Map<String, dynamic> json) => json['recentSearch'] as String;

  @override
  Map<String, String> toJson(String state) => {'recentSearch': state};
}
