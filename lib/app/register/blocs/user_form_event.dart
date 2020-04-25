import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class UserFormEvent extends Equatable {
  final valueInput;
  const UserFormEvent({@required this.valueInput});

  @override
  List<Object> get props => [valueInput];
}

class EmailChanged extends UserFormEvent {
  const EmailChanged({valueInput}) : super(valueInput: valueInput);

  @override
  String toString() => 'EmailChanged { email: $valueInput }';
}

class NameChanged extends UserFormEvent {
  const NameChanged({valueInput}) : super(valueInput: valueInput);

  @override
  String toString() => 'NameChanged { name: $valueInput }';
}

class LastNameChanged extends UserFormEvent {
  const LastNameChanged({valueInput}) : super(valueInput: valueInput);

  @override
  String toString() => 'LastNameChanged { lastName: $valueInput }';
}

class TypeDocChanged extends UserFormEvent {
  const TypeDocChanged({valueInput}) : super(valueInput: valueInput);

  @override
  String toString() => 'TypeDocChanged { typeDoc: $valueInput }';
}

class DocChanged extends UserFormEvent {
  const DocChanged({valueInput}) : super(valueInput: valueInput);

  @override
  String toString() => 'DocChanged { doc: $valueInput }';
}

class PhoneChanged extends UserFormEvent {
  const PhoneChanged({valueInput}) : super(valueInput: valueInput);

  @override
  String toString() => 'PhoneChanged { phone: $valueInput }';
}

class DateChanged extends UserFormEvent {
  const DateChanged({valueInput}) : super(valueInput: valueInput);

  @override
  String toString() => 'DateChanged { date: $valueInput }';
}

class ImageChanged extends UserFormEvent {
  const ImageChanged({valueInput}) : super(valueInput: valueInput);

  @override
  String toString() => 'ImageChanged { image: ${valueInput?.path} }';
}

class FormSubmitted extends UserFormEvent {}

class FormReset extends UserFormEvent {}
