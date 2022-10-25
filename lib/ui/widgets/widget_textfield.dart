import 'dart:developer';

import 'package:flutter/material.dart';

class TextFieldAndFormTestRoute extends StatefulWidget {
  const TextFieldAndFormTestRoute({Key? key}) : super(key: key);

  @override
  State<TextFieldAndFormTestRoute> createState() =>
      _TextFieldAndFormTestRouteState();
}

class _TextFieldAndFormTestRouteState extends State<TextFieldAndFormTestRoute> {
  String _userName = '';
  String _userNameByController = '';
  bool _cipher = true;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _customerDividerController =
      TextEditingController();

  final GlobalKey _formKey = GlobalKey();

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    _userNameController.addListener(() {
      setState(() {
        _userNameByController = _userNameController.text;
      });
    });
    _userNameFocusNode.addListener(() {
      log('${_userNameFocusNode.hasFocus}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              _buildUserName(),
              _buildPassword(),
              _buildCustomDivider(),
              Text('onChange:$_userName'),
              Text('onController:$_userNameByController'),
              _buildLogin(context),
              _buildLoginByController(context),
              _buildHideKeyboard(context),
              _buildGetValue(context),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildGetValue(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(_userNameController.text)));
      },
      child: const Text('Get focused value'),
    );
  }

  Row _buildHideKeyboard(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildChangeFocus(context),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            _userNameFocusNode.unfocus();
            _passwordFocusNode.unfocus();
          },
          child: const Text('Hide keyboard'),
        ),
      ],
    );
  }

  Row _buildLoginByController(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Builder(builder: (builder) {
            return ElevatedButton(
                onPressed: () {
                  if (Form.of(builder)?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login success')));
                  }
                },
                child: const Text('Login by builder'));
          }),
        ),
      ],
    );
  }

  Row _buildLogin(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if ((_formKey.currentState as FormState).validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login success')));
              }
            },
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }

  ElevatedButton _buildChangeFocus(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_userNameFocusNode.hasFocus) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        } else {
          FocusScope.of(context).requestFocus(_userNameFocusNode);
        }
      },
      child: const Text('Change focus'),
    );
  }

  Widget _buildCustomDivider() {
    _customerDividerController.text = 'git@github.com';
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!, width: 1.0),
        ),
      ),
      child: TextField(
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.emailAddress,
        controller: _customerDividerController,
        decoration: const InputDecoration(
          labelText: 'Email',
          hintText: 'input you email',
          prefixIcon: Icon(Icons.email),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Theme(
      data: ThemeData(
        hintColor: Colors.grey[200],
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.yellow),
          hintStyle: TextStyle(color: Colors.green),
        ),
      ),
      child: TextFormField(
        controller: _passwordController,
        focusNode: _passwordFocusNode,
        style: const TextStyle(fontSize: 14.0),
        validator: (value) {
          return (value?.trim().length ?? 0) > 5
              ? null
              : 'pass word must grater than 5';
        },
        decoration: InputDecoration(
            labelText: 'Password',
            // labelStyle: const TextStyle(fontSize: 13.0),
            hintText: 'input your password',
            // hintStyle: const TextStyle(fontSize: 12.0),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _cipher = !_cipher;
                });
              },
              icon: const Icon(Icons.remove_red_eye),
            )),
        obscureText: _cipher,
      ),
    );
  }

  Widget _buildUserName() {
    return TextFormField(
      controller: _userNameController,
      focusNode: _userNameFocusNode,
      autofocus: false,
      style: const TextStyle(fontSize: 14.0),
      validator: (value) {
        return (value?.trim().isNotEmpty ?? false)
            ? null
            : 'please input user name';
      },
      onChanged: (value) {
        setState(() {
          _userName = value;
        });
      },
      decoration: const InputDecoration(
        labelText: 'User name',
        labelStyle: TextStyle(fontSize: 13.0),
        hintText: 'user name or email',
        hintStyle: TextStyle(fontSize: 12.0),
        prefixIcon: Icon(Icons.person),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}

void run() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('TextField and Form'),
      ),
      body: const Center(
        child: (TextFieldAndFormTestRoute()),
      ),
    ),
  ));
}
