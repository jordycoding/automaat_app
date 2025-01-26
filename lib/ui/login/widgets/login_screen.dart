import 'package:automaat_app/routing/app_routes.dart';
import 'package:automaat_app/ui/core/ui/input_dialog.dart';
import 'package:automaat_app/ui/login/view_models/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewmodel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.login.addListener(_onResult);
    widget.viewModel.resetPassword.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.login.removeListener(_onResult);
    oldWidget.viewModel.resetPassword.removeListener(_onResult);
    widget.viewModel.login.addListener(_onResult);
    widget.viewModel.resetPassword.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.login.removeListener(_onResult);
    widget.viewModel.resetPassword.removeListener(_onResult);
    super.dispose();
  }

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
              const SizedBox(height: 24),
              TextFormField(
                  controller: _userNameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Username",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a username";
                    }
                    return null;
                  }),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Password",
                ),
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
                  FilledButton(
                      onPressed: () {
                        widget.viewModel.login.execute(
                          (
                            _userNameController.value.text,
                            _passwordController.value.text
                          ),
                        );
                      },
                      child: const Text("Login")),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {
                      context.push(AppRoutes.register);
                    },
                    child: const Text("Register"),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Center(
                child: FilledButton(
                    onPressed: () async {
                      final result = await displayInputDialog(
                        context,
                        "Reset password",
                        "Enter your email",
                      );
                      if (result != null) {
                        final (email, _) = result;
                        widget.viewModel.resetPassword.execute(email);
                      }
                    },
                    child: const Text("Forgot password"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red)),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.login.completed) {
      widget.viewModel.login.clearResult();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login sucesfull")));
    }
    if (widget.viewModel.login.error) {
      widget.viewModel.login.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("There was an error logging in")));
    }
    if (widget.viewModel.resetPassword.completed) {
      widget.viewModel.resetPassword.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("An email for resetting your passsword has been sent"),
        ),
      );
    }
    if (widget.viewModel.resetPassword.error) {
      widget.viewModel.resetPassword.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("There was an error resetting your password"),
        ),
      );
    }
  }
}
