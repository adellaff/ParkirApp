import 'package:flutter/material.dart';
import 'package:parkir_app/models/user.dart';
import 'package:parkir_app/screens/admin_bottom_tab.dart';
import 'package:parkir_app/screens/petugas_bottom_tab.dart';
// import 'package:parkir_app/screens/admin_screen.dart';
import 'package:parkir_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  var _data = User();
  var _isLoading = false;

  submitLogin() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState.save();
      try {
        var valid = await AuthService().loginUser(_data);
        
        var role = valid['user']['id_role'];
        // print(valid._data.idRole);
        if (valid != 0) {
          if (role == 1) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return AdminBottomTab();
            }));
          } else if(role == 2) {
            Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
            return PetugasBottomTab();
          }));
          }
        } else {
          print('error');
        }
      } catch (error) {
        return error;
      }
    }
  }

  String _validateEmpty(String value) {
    if (value.length == 0) {
      return 'Input Username or Password';
    }
    return null;
  }

  // final usernameController = TextEditingController();
  // final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: _isLoading
            ? Container(
                height: 200, child: Center(child: CircularProgressIndicator()))
            : Scaffold(
                body: Container(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Card(
                        color: Colors.lightBlue,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: 300,
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('PARKIR KUY'),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Username',
                                        contentPadding: EdgeInsets.fromLTRB(
                                            20, 15, 20, 15)),
                                    validator: _validateEmpty,
                                    onSaved: (String value) {
                                      _data.username = value;
                                    }),
                                TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        contentPadding: EdgeInsets.fromLTRB(
                                            20, 15, 20, 15)),
                                    validator: _validateEmpty,
                                    onSaved: (String value) {
                                      _data.password = value;
                                    }),
                                RaisedButton(
                                  color: Colors.white,
                                  onPressed: submitLogin,
                                  child: Text('LOGIN'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )));
  }
}
