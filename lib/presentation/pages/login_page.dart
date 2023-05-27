import 'package:flutter/material.dart';

import '../../core/_core.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // key: _formKey,
        child: Center(
          child: Card(
            elevation: 8,
            child: Container(
              padding: const EdgeInsets.all(32.0),
              constraints: const BoxConstraints(maxWidth: 350),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("jobeee", style: Theme.of(context).textTheme.headlineSmall)
                  ),
                  CommonUtil.gap(height: 16),
                  TextFormField(
                    validator: (value) {
                      // add email validation
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return 'Please enter a valid email';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email_outlined),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  CommonUtil.gap(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        )),
                  ),
                  CommonUtil.gap(height: 16),
                  CheckboxListTile(
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: _rememberMe,
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _rememberMe = value;
                      });
                    },
                    title: const Text('Remember me'),
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true,
                    contentPadding: const EdgeInsets.all(0),
                  ),
                  CommonUtil.gap(height: 16),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        minimumSize: Size(150, 20)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Sign in',
                          
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.characters);
                      },
                  ),
                  CommonUtil.gap(height: 16),
                  SignInButton(
                    Buttons.GoogleDark,
                    onPressed: () {},
                    text: "Sign up with Google",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
