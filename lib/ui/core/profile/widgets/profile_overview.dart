import 'package:automaat_app/data/services/api/model/customer_resource/customer_resource.dart';
import 'package:flutter/material.dart';

class ProfileOverview extends StatelessWidget {
  const ProfileOverview({super.key, required this.profile});

  final CustomerResource profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi ${profile.firstName ?? ''} ${profile.lastName ?? ''}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        Text(
          "First name: ${profile.firstName ?? 'n/a'}",
        ),
        Text("Last name: ${profile.lastName ?? 'n/a'}"),
        Text("Member from: ${profile.from ?? 'n/a'}"),
        if (profile.location != null) ...[
          Text("Location", style: Theme.of(context).textTheme.titleMedium),
          Text("Address ${profile.location!.streetAddress ?? 'n/a'}"),
          Text("Postal code: ${profile.location!.postalCode ?? 'n/a'}"),
          Text("City: ${profile.location!.city ?? 'n/a'}"),
          Text("State/Province: ${profile.location!.stateProvince ?? 'n/a'}"),
        ]
      ],
    );
  }
}
