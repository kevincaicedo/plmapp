import 'package:equatable/equatable.dart';

abstract class WelcomeEvent extends Equatable {
  const WelcomeEvent();

  @override
  List<Object> get props => [];
}

class AccepTermsEvent extends WelcomeEvent {
  final bool isAgreeTerms;
  const AccepTermsEvent({this.isAgreeTerms});

  @override
  String toString() => 'AccepTermsEvent { isAgreeTerms: $isAgreeTerms }';
}
