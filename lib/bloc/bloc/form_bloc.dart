import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:screen1/user.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormBlocState> {
  final List<User> users = [];

  int? isEdit;

  FormBloc() : super(FormInitial()) {
    on<SubmitEvent>((event, emit) {
      if (isEdit != null) {
        users[isEdit!] = User(name: event.name, mobile: event.mobile);
        isEdit = null;
      } else {
        users.add(User(name: event.name, mobile: event.mobile));
      }

      emit(FormLoaded(users));
    });

    on<EditEvent>((event, emit) {
      isEdit = event.index;

      // emit(
      //   InputFieldLoaded(
      //     name: event.name,
      //     mobile: event.mobile,
      //     index: event.index,
      //   ),
      // );
    });
  }
}
