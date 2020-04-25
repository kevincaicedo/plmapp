import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plmapp/app/register/blocs/user_form_bloc.dart';
import 'package:plmapp/app/register/blocs/user_form_event.dart';
import 'package:plmapp/app/register/blocs/user_form_state.dart';
import 'package:plmapp/app/register/models/user.dart';
import 'package:plmapp/extension/date.dart';
import 'package:plmapp/locator.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Register User",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
            child: BlocProvider(
              create: (context) => UserFormBloc(repository: getIt()),
              child: const RegisterForm(),
            ),
          )
        ],
      ))),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm();

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final dateField = TextEditingController();

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in CITIES) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  Future<Null> _selectDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2020),
        firstDate: DateTime(1900),
        lastDate: DateTime(2021));

    dateField.text = picked.format();
    context.bloc<UserFormBloc>().add(DateChanged(valueInput: dateField.text));
  }

  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    context.bloc<UserFormBloc>().add(ImageChanged(valueInput: image));
  }

  void showSnackbar(String message, Color bgColor) async {
    final snackBar = SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: bgColor);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserFormBloc, UserFormState>(
        listener: (context, state) {
      if (state.networkStateForm.formSendError) {
        showSnackbar("Ocurrio un error intenta nuevamente", Colors.red);
      } else if (state.networkStateForm.formSendSuccess) {
        showSnackbar("Registro exitoso", Colors.green);
      }
    }, builder: (context, state) {
      return Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Nombre",
              ),
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(color: Colors.black),
              validator: (_) {
                return state.isNameValid ? null : "Campo requerido";
              },
              onChanged: (value) {
                context
                    .bloc<UserFormBloc>()
                    .add(NameChanged(valueInput: value));
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Apellido",
              ),
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(color: Colors.black),
              validator: (_) {
                return state.isLastNameValid ? null : "Campo requerido";
              },
              onChanged: (value) {
                context
                    .bloc<UserFormBloc>()
                    .add(LastNameChanged(valueInput: value));
              },
            ),
            DropdownButton(
              value: state.typeDoc.isNotEmpty ? state.typeDoc : CITIES[0],
              items: getDropDownMenuItems(),
              onChanged: (selected) {
                context
                    .bloc<UserFormBloc>()
                    .add(TypeDocChanged(valueInput: selected));
              },
              isExpanded: true,
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Documento de identidad",
              ),
              textCapitalization: TextCapitalization.characters,
              style: TextStyle(color: Colors.black),
              validator: (_) {
                return state.isDocValid ? null : "Documento Invalido";
              },
              onChanged: (value) {
                context.bloc<UserFormBloc>().add(DocChanged(valueInput: value));
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Correo Electrónico",
              ),
              style: TextStyle(color: Colors.black),
              validator: (_) => state.isEmailValid ? null : "Correo Invalido",
              onChanged: (value) {
                context
                    .bloc<UserFormBloc>()
                    .add(EmailChanged(valueInput: value.trim()));
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Celular",
              ),
              textCapitalization: TextCapitalization.characters,
              style: TextStyle(color: Colors.black),
              validator: (_) {
                return state.isPhoneValid ? null : "Telefono Invalido";
              },
              onChanged: (value) {
                context
                    .bloc<UserFormBloc>()
                    .add(PhoneChanged(valueInput: value));
              },
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => _selectDate(),
              child: IgnorePointer(
                child: TextFormField(
                    controller: dateField,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "Fecha de Nacimiento",
                    ),
                    textCapitalization: TextCapitalization.characters,
                    style: TextStyle(color: Colors.black),
                    validator: (_) {
                      return state.isDateValid ? null : "Fecha Invalido";
                    }),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => getImage(),
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey),
                child: state.image == null
                    ? Text('No image selected.', textAlign: TextAlign.center)
                    : Image.file(state.image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            state.networkStateForm.formSendProgress
                ? CircularProgressIndicator()
                : RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate())
                        context.bloc<UserFormBloc>().add(FormSubmitted());
                    },
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                    padding: const EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text('Save', style: TextStyle(fontSize: 20)),
                  )
          ]));
    });
  }
}
