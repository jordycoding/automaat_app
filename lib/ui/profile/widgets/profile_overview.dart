import 'package:automaat_app/data/services/api/model/customer_resource/customer_resource.dart';
import 'package:automaat_app/data/services/api/model/rental/rental.dart';
import 'package:automaat_app/routing/app_routes.dart';
import 'package:automaat_app/ui/profile/widgets/rental_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileOverview extends StatelessWidget {
  const ProfileOverview({super.key, required this.profile});

  final CustomerResource profile;

  @override
  Widget build(BuildContext context) {
    final rentals = profile.rentals
        ?.where((rental) => rental.state == RentalState.returned)
        .toList();
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
        ],
        const SizedBox(height: 10),
        if (rentals != null && rentals!.isNotEmpty)
          Text("Previous rentals",
              style: Theme.of(context).textTheme.titleMedium),
        if (rentals == null || rentals!.isEmpty)
          const Text("No previous rentals")
        else ...[
          RentalList(
            rentals: rentals.take(3).toList(),
          ),
          const SizedBox(height: 5.0),
          FilledButton(
            onPressed: () {
              context.push("${AppRoutes.pastRentals}/${profile.id}");
            },
            child: const Text("View all rental details"),
          )
        ]
      ],
    );
  }
}
