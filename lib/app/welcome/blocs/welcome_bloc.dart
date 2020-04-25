import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plmapp/app/welcome/blocs/welcome_event.dart';
import 'package:plmapp/app/welcome/blocs/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  @override
  WelcomeState get initialState => StateAcceptTerms(isAgreeTerms: false);

  @override
  Stream<WelcomeState> mapEventToState(WelcomeEvent event) async* {
    if (event is AccepTermsEvent) yield* _mapAccepTermsEventToState(event);
  }

  Stream<WelcomeState> _mapAccepTermsEventToState(
      AccepTermsEvent event) async* {
    yield StateAcceptTerms(isAgreeTerms: event.isAgreeTerms);
  }
}
