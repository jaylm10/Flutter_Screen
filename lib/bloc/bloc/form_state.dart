part of 'form_bloc.dart';

@immutable
sealed class FormBlocState {}

final class FormInitial extends FormBlocState {}

final class FormLoaded extends FormBlocState {

    final List<User> users;

    FormLoaded(this.users);

}

// final class InputFieldLoaded extends FormBlocState {

//     final String name;
//     final String mobile;
//     final int index;

//     InputFieldLoaded({required this.name,required this.mobile, required this.index});

// }


