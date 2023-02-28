import 'package:dbstech_blocapi/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserState extends Equatable {}

// Data Loading state
class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

// Data Loaded State
class UserLoadedState extends UserState {
  UserLoadedState({required this.users});
  final List<UserModel> users;
  @override
  List<Object?> get props => [users];
}

// Data error state
class UserErrorState extends UserState {
  UserErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
