import 'package:automaat_app/ui/register/view_models/register_viewmodel.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.viewModel});

  final RegisterViewmodel viewModel;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.register.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant RegisterScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.register.removeListener(_onResult);
    widget.viewModel.register.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.register.removeListener(_onResult);
    super.dispose();
  }

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
                controller: _userNameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Username",
                ),
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "First name",
                ),
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Last name",
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Email",
                ),
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Password",
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: FilledButton(
                  onPressed: () {
                    widget.viewModel.register.execute((
                      _userNameController.value.text,
                      _firstNameController.value.text,
                      _lastNameController.value.text,
                      _emailController.value.text,
                      _passwordController.value.text
                    ));
                  },
                  child: const Text("Register"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.register.completed) {
      widget.viewModel.register.clearResult();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registered succesfully")));
    }

    if (widget.viewModel.register.error) {
      widget.viewModel.register.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("There was an error registering")));
    }
  }
}
