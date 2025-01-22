import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      resizeToAvoidBottomInset: false,
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
              const SizedBox(height: 24),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Username"),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "First name"),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Last name"),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Email"),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Password"),
              ),
              const SizedBox(height: 20),
              Center(
                child: FilledButton(
                  onPressed: () {},
                  child: const Text("Register"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
