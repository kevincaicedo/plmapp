import 'package:equatable/equatable.dart';

abstract class WelcomeState extends Equatable {
  const WelcomeState();

  @override
  List<Object> get props => [];
}

class StateAcceptTerms extends WelcomeState {
  final bool isAgreeTerms;
  const StateAcceptTerms({this.isAgreeTerms});

  @override
  List<Object> get props => [isAgreeTerms];

  StateAcceptTerms copyWith({
    bool isAgreeTerms,
  }) {
    return StateAcceptTerms(
      isAgreeTerms: isAgreeTerms ?? this.isAgreeTerms,
    );
  }

  @override
  String toString() {
    return '''StateAcceptTerms {
      isAgreeTerms: $isAgreeTerms
    }''';
  }
}
