import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plmapp/app/register/blocs/user_form_event.dart';
import 'package:plmapp/app/register/blocs/user_form_state.dart';
import 'package:plmapp/app/register/repositories/register_repository.dart';
import 'package:plmapp/extension/string.dart';

class UserFormBloc extends Bloc<UserFormEvent, UserFormState> {
  @override
  UserFormState get initialState => UserFormState.initial();
  final RegisterRepository repository;
  UserFormBloc({this.repository});

  @override
  Stream<UserFormState> mapEventToState(UserFormEvent event) async* {
    if (event is EmailChanged)
      yield* _mapEmailChangedToState(event);
    else if (event is NameChanged)
      yield* _mapNameChangedToState(event);
    else if (event is LastNameChanged)
      yield* _mapLastNameChangedToState(event);
    else if (event is TypeDocChanged)
      yield* _mapTypeDocChangedToState(event);
    else if (event is DocChanged)
      yield* _mapDocChangedToState(event);
    else if (event is PhoneChanged)
      yield* _mapPhoneChangedToState(event);
    else if (event is DateChanged)
      yield* _mapDateChangedToState(event);
    else if (event is ImageChanged)
      yield* _mapImageChangedToState(event);
    else if (event is FormSubmitted)
      yield* _mapFormSubmittedToState(event);
    else if (event is FormReset) yield* _mapFormResetToState(event);
  }

  Stream<UserFormState> _mapEmailChangedToState(UserFormEvent event) async* {
    yield state.copyWith(
      email: event.valueInput,
      networkStateForm: NetworkStateForm.initial(),
      isEmailValid: _isEmailValid(event.valueInput),
    );
  }

  Stream<UserFormState> _mapNameChangedToState(UserFormEvent event) async* {
    yield state.copyWith(
      name: event.valueInput,
      networkStateForm: NetworkStateForm.initial(),
      isNameValid: _isNameValid(event.valueInput),
    );
  }

  Stream<UserFormState> _mapLastNameChangedToState(UserFormEvent event) async* {
    yield state.copyWith(
      lastName: event.valueInput,
      networkStateForm: NetworkStateForm.initial(),
      isLastNameValid: _isLastNameValid(event.valueInput),
    );
  }

  Stream<UserFormState> _mapTypeDocChangedToState(UserFormEvent event) async* {
    yield state.copyWith(
      typeDoc: event.valueInput,
      networkStateForm: NetworkStateForm.initial(),
      isTypeDocValid: _isTypeDocValid(event.valueInput),
    );
  }

  Stream<UserFormState> _mapDocChangedToState(UserFormEvent event) async* {
    yield state.copyWith(
      doc: event.valueInput,
      networkStateForm: NetworkStateForm.initial(),
      isDocValid: _isDocValid(event.valueInput),
    );
  }

  Stream<UserFormState> _mapPhoneChangedToState(UserFormEvent event) async* {
    yield state.copyWith(
      phone: event.valueInput,
      networkStateForm: NetworkStateForm.initial(),
      isPhoneValid: _isPhoneValid(event.valueInput),
    );
  }

  Stream<UserFormState> _mapDateChangedToState(UserFormEvent event) async* {
    yield state.copyWith(
      date: event.valueInput,
      networkStateForm: NetworkStateForm.initial(),
      isDateValid: _isDateValid(event.valueInput),
    );
  }

  Stream<UserFormState> _mapImageChangedToState(UserFormEvent event) async* {
    yield state.copyWith(
      image: event.valueInput,
      networkStateForm: NetworkStateForm.initial(),
      isImageValid: _isImageValid(event.valueInput),
    );
  }

  Stream<UserFormState> _mapFormSubmittedToState(UserFormEvent event) async* {
    yield state.copyWith(
        networkStateForm: state.networkStateForm.copyWith(
            formSendProgress: true,
            formSendError: false,
            formSendSuccess: false));

    final rep = await repository.saveUser(state.toUser());
    yield state.copyWith(
        networkStateForm: state.networkStateForm.copyWith(
            formSendError: !rep,
            formSendProgress: false,
            formSendSuccess: rep));
  }

  Stream<UserFormState> _mapFormResetToState(UserFormEvent event) async* {
    yield UserFormState.initial();
  }

  bool _isNameValid(String input) => !input.isBlankOrNull;
  bool _isLastNameValid(String input) => !input.isBlankOrNull;
  bool _isTypeDocValid(String input) => !input.isBlankOrNull;
  bool _isDocValid(String input) => !input.isBlankOrNull && input.isNumber;
  bool _isEmailValid(String input) => input.isEmailValid();
  bool _isPhoneValid(String input) => !input.isBlankOrNull && input.isNumber;
  bool _isDateValid(String input) => !input.isBlankOrNull;
  bool _isImageValid(File input) => input != null;
}
