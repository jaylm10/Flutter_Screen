part of 'form_bloc.dart';

@immutable
sealed class FormEvent {}

class SubmitEvent extends FormEvent{
  final String name;
  final String mobile;

  SubmitEvent({required this.name,required this.mobile});

}

class EditEvent extends FormEvent{


  final int index;
 

  EditEvent({required this.index});

}