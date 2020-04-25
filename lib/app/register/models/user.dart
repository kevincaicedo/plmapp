import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class User extends Equatable {
  final String name;
  final String lastName;
  final String typeDoc;
  final String doc;
  final String email;
  final String phone;
  final String date;
  final String image;

  const User(
      {@required this.name,
      @required this.lastName,
      @required this.typeDoc,
      @required this.doc,
      @required this.email,
      @required this.phone,
      @required this.date,
      @required this.image});

  @override
  List<Object> get props =>
      [name, lastName, typeDoc, doc, email, phone, date, image];

  @override
  String toString() {
    return '''User {
      name: $name,
      lastName: $lastName,
      typeDoc: $typeDoc,
      doc: $doc,
      email: $email,
      phone: $phone,
      date: $date,
      image: $image
    }''';
  }

  Map<String, dynamic> toJson() => {
        "name": this.name,
        "lastName": this.lastName,
        "typeDoc": this.typeDoc,
        "doc": this.doc,
        "email": this.email,
        "phone": this.phone,
        "date": this.date,
        "image": this.image
      };
}

const List CITIES = [
  "Cédula de Ciudadanía",
  "Cédula de Extranjería",
  "Pasaporte",
  "Registro Civil",
  "Tarjeta de Identidad"
];
