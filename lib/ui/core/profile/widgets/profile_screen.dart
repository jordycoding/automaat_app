import 'package:automaat_app/ui/core/profile/view_models/profile_viewmodel.dart';
import 'package:automaat_app/ui/core/profile/widgets/profile_overview.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.viewModel});

  final ProfileViewModel viewModel;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getProfile.addListener(_onResult);
    widget.viewModel.getProfile.execute();
  }

  @override
  void didUpdateWidget(covariant ProfileScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.getProfile.removeListener(_onResult);
    widget.viewModel.getProfile.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.getProfile.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your profile"),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return widget.viewModel.getProfile.execute();
        },
        child: ListView(
          children: [
            ListenableBuilder(
              listenable: Listenable.merge([
                widget.viewModel.getProfile,
              ]),
              builder: (context, child) {
                final profile = widget.viewModel.profile;
                if (widget.viewModel.getProfile.running) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (widget.viewModel.getProfile.error) {
                  return const Center(
                    child: Text("Error fetching profile"),
                  );
                }
                if (profile != null) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ProfileOverview(profile: profile),
                        const SizedBox(height: 10),
                        LogoutButton(logout: widget.viewModel.logout.execute)
                      ],
                    ),
                  );
                }
                return Column(
                  children: <Widget>[
                    Text("No profile info available"),
                    const SizedBox(height: 10),
                    LogoutButton(logout: widget.viewModel.logout.execute)
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.getProfile.completed) {
      widget.viewModel.getProfile.clearResult();
    }
    if (widget.viewModel.getProfile.error) {
      widget.viewModel.getProfile.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("There was an error fetching your profile"),
        ),
      );
    }
  }
}

class LogoutButton extends StatelessWidget {
  final Function logout;

  const LogoutButton({required this.logout});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        logout();
      },
      style: FilledButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("Logout"),
    );
  }
}
