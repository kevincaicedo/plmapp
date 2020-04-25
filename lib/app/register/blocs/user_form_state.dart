import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:plmapp/app/register/models/user.dart';
import 'package:plmapp/extension/file.dart';

class UserFormState extends Equatable {
  final String name;
  final bool isNameValid;

  final String lastName;
  final bool isLastNameValid;

  final String typeDoc;
  final bool isTypeDocValid;

  final String doc;
  final bool isDocValid;

  final String email;
  final bool isEmailValid;

  final String phone;
  final bool isPhoneValid;

  final String date;
  final bool isDateValid;

  final File image;
  final bool isImageValid;

  final NetworkStateForm networkStateForm;

  bool get isFormValid =>
      isNameValid &&
      isLastNameValid &&
      isTypeDocValid &&
      isDocValid &&
      isEmailValid &&
      isPhoneValid &&
      isDateValid &&
      isImageValid;

  const UserFormState(
      {@required this.name,
      @required this.lastName,
      @required this.typeDoc,
      @required this.doc,
      @required this.email,
      @required this.phone,
      @required this.date,
      @required this.image,
      @required this.networkStateForm,
      @required this.isNameValid,
      @required this.isLastNameValid,
      @required this.isTypeDocValid,
      @required this.isDocValid,
      @required this.isEmailValid,
      @required this.isPhoneValid,
      @required this.isDateValid,
      @required this.isImageValid});

  factory UserFormState.initial() {
    return UserFormState(
      name: '',
      lastName: '',
      typeDoc: '',
      doc: '',
      email: '',
      phone: '',
      date: '',
      image: null,
      networkStateForm: NetworkStateForm.initial(),
      isNameValid: false,
      isLastNameValid: false,
      isTypeDocValid: false,
      isDocValid: false,
      isEmailValid: false,
      isPhoneValid: false,
      isDateValid: false,
      isImageValid: false,
    );
  }

  UserFormState copyWith(
      {String name,
      String lastName,
      String typeDoc,
      String doc,
      String email,
      String phone,
      String date,
      File image,
      NetworkStateForm networkStateForm,
      bool isNameValid,
      bool isLastNameValid,
      bool isTypeDocValid,
      bool isDocValid,
      bool isEmailValid,
      bool isPhoneValid,
      bool isDateValid,
      bool isImageValid}) {
    return UserFormState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      typeDoc: typeDoc ?? this.typeDoc,
      doc: doc ?? this.doc,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      date: date ?? this.date,
      image: image ?? this.image,
      networkStateForm: networkStateForm ?? this.networkStateForm,
      isNameValid: isNameValid ?? this.isNameValid,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
      isTypeDocValid: isTypeDocValid ?? this.isTypeDocValid,
      isDocValid: isDocValid ?? this.isDocValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
      isDateValid: isDateValid ?? this.isDateValid,
      isImageValid: isImageValid ?? this.isImageValid,
    );
  }

  @override
  String toString() {
    return '''UserFormState {
      name: $name,
      lastName: $lastName,
      typeDoc: $typeDoc,
      doc: $doc,
      email: $email,
      phone: $phone,
      date: $date,
      image: ${image.path},
      networkStateForm: ${networkStateForm.toString()}
      isNameValid: $isNameValid
      isLastNameValid: $isLastNameValid
      isTypeDocValid: $isTypeDocValid
      isDocValid: $isDocValid
      isEmailValid: $isEmailValid
      isPhoneValid: $isPhoneValid
      isDateValid: $isDateValid
      isImageValid: $isImageValid
    }''';
  }

  @override
  List<Object> get props => [
        name,
        lastName,
        typeDoc,
        doc,
        email,
        phone,
        date,
        image,
        networkStateForm,
        isNameValid,
        isLastNameValid,
        isTypeDocValid,
        isDocValid,
        isEmailValid,
        isPhoneValid,
        isDateValid,
        isImageValid
      ];
}

class NetworkStateForm extends Equatable {
  final bool formSendSuccess;
  final bool formSendError;
  final bool formSendProgress;
  const NetworkStateForm(
      {this.formSendSuccess, this.formSendError, this.formSendProgress});

  @override
  List<Object> get props => [formSendSuccess, formSendError, formSendProgress];

  NetworkStateForm copyWith({
    bool formSendSuccess,
    bool formSendError,
    bool formSendProgress,
  }) {
    return NetworkStateForm(
      formSendSuccess: formSendSuccess ?? this.formSendSuccess,
      formSendError: formSendError ?? this.formSendError,
      formSendProgress: formSendProgress ?? this.formSendProgress,
    );
  }

  factory NetworkStateForm.initial() {
    return NetworkStateForm(
      formSendSuccess: false,
      formSendError: false,
      formSendProgress: false,
    );
  }

  @override
  String toString() {
    return '''NetworkStateForm {
      formSendSuccess: $formSendSuccess
      formSendError: $formSendError
      formSendProgress: $formSendProgress
    }''';
  }
}

extension Parser on UserFormState {
  User toUser() {
    return User(
      name: this.name,
      lastName: this.lastName,
      typeDoc: this.typeDoc.isEmpty ? CITIES[0] : this.typeDoc,
      doc: this.doc,
      email: this.email,
      phone: this.phone,
      date: this.date,
      image: this.image.toBase64(),
    );
  }
}
