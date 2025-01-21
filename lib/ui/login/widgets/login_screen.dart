import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text("Automaat",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              SizedBox(height: 24),
              TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: "Username"),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a username";
                    }
                    return null;
                  }),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Password"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a password";
                  }
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FilledButton(onPressed: () {}, child: const Text("Login")),
                  SizedBox(width: 10),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      child: const Text("Register"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
