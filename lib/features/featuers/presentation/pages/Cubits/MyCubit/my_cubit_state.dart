part of 'my_cubit_cubit.dart';

@immutable
sealed class MyCubitState {}

final class MyCubitInitial extends MyCubitState {}

final class insertedState extends MyCubitState {}

final class Loading extends MyCubitState {}
