import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plmapp/app/welcome/blocs/welcome_bloc.dart';
import 'package:plmapp/app/welcome/blocs/welcome_event.dart';
import 'package:plmapp/app/welcome/blocs/welcome_state.dart';
import 'package:plmapp/config/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (_) => WelcomeBloc(),
          child: BlocBuilder<WelcomeBloc, WelcomeState>(
              condition: (context, state) => state is StateAcceptTerms,
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("PLM",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w900)),
                    Text("Welcome", style: TextStyle(fontSize: 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                            value: (state as StateAcceptTerms).isAgreeTerms,
                            onChanged: (value) {
                              context
                                  .bloc<WelcomeBloc>()
                                  .add(AccepTermsEvent(isAgreeTerms: value));
                            }),
                        const Text("I Agree to Terms",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    RaisedButton(
                      onPressed: !(state as StateAcceptTerms).isAgreeTerms
                          ? null
                          : () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  Routes.register,
                                  (Route<dynamic> route) => false);
                            },
                      textColor: Colors.white,
                      color: Colors.blueAccent,
                      padding: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text('Next', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
