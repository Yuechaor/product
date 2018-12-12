import 'package:flutter/material.dart';
import 'package:learning_flutter/pages/product_list.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final String emailReg = '';
  final Map<String, dynamic> _authFormData = {
    'email': null,
    'password': null,
    'term': false,
  };
  final GlobalKey<FormState> _authFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double ajustedWidth = deviceWidth > 768 ? 400.0 : deviceWidth * 0.95;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: ajustedWidth,
              child: Form(
                key: _authFormKey,
                child: Column(children: <Widget>[
                  // email
                  _buildEmailInput(),
                  SizedBox(
                    height: 10.9,
                  ),
                  //password
                  _buildPasswordInput(),
                  _buildSwitchButton(),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: _submitAuthForm,
                    child: Text(
                      'Log in',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

/* methods */

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/Deakin.png'),
    );
  }

  Widget _buildEmailInput() {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.2),
        labelText: 'Email',
        //labelStyle: TextStyle()
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'must be an valide email';
        }
      },
      onSaved: (String value) {
        _authFormData['email'] = value;
      },
    );
  }

  Widget _buildPasswordInput() {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.2),
        labelText: 'Password',

        //labelStyle: TextStyle()
      ),
      validator: (String value) {
        if (value.isEmpty || value.length <= 6) {
          return 'cannot be empty! or must be longger than 6 charactors!';
        }
      },
      obscureText: true,
      onSaved: (String value) {
        _authFormData['password'] = value;
      },
    );
  }

  Widget _buildSwitchButton() {
    return SwitchListTile(
      title: Text('Accept Terms'),
      value: _authFormData['term'],
      onChanged: (bool value) {
        setState(() {
          _authFormData['term'] = value;
        });
      },
    );
  }

  // Widget _buildLoginButton() {
  //   return RaisedButton(
  //     color: Theme.of(context).primaryColor,
  //     textColor: Colors.white,
  //     onPressed: _submitAuthForm,
  //     child: Text(
  //       'Log in',
  //       style: TextStyle(fontSize: 20),
  //     ),
  //   );
  // }

  void _submitAuthForm() {
    if (!_authFormKey.currentState.validate() || !_authFormData['term']) {
      return;
    }
    _authFormKey.currentState.save();
    print(_authFormData);
    Navigator.pushReplacementNamed(context, '/list');
  }
}
