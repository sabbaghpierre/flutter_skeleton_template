part of 'example_cubit.dart';

@immutable
abstract class ExampleState {}

class ExampleInitial extends ExampleState {}
class ExampleLoading extends ExampleState {}
class ExampleFailure extends ExampleState {}
class ExampleSuccess extends ExampleState {}
