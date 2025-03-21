import 'package:automaat_app/routing/app_routes.dart';
import 'package:automaat_app/ui/profile/widgets/rental_list.dart';
import 'package:automaat_app/ui/rentals/view_models/rental_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

class RentalScreen extends StatefulWidget {
  const RentalScreen({super.key, required this.viewModel});

  final RentalViewModel viewModel;

  @override
  State<RentalScreen> createState() => _RentalScreenState();
}

class _RentalScreenState extends State<RentalScreen> {
  final _log = Logger("Rental screen");

  @override
  void initState() {
    super.initState();
    widget.viewModel.getRentals.addListener(_onResult);
    if (widget.viewModel.rentals.isEmpty) {
      widget.viewModel.getRentals.execute();
    }
  }

  @override
  void didUpdateWidget(covariant RentalScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.getRentals.removeListener(_onResult);
    widget.viewModel.getRentals.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.getRentals.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your current rentals"),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return widget.viewModel.getRentals.execute();
        },
        child: ListView(
          children: [
            ListenableBuilder(
              listenable: Listenable.merge([widget.viewModel.getRentals]),
              builder: (context, child) {
                final rentals = widget.viewModel.rentals;
                if (widget.viewModel.getRentals.running) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (rentals.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RentalList(
                      rentals: rentals,
                      onClick: (rental) {
                        _log.info(rental);
                        context.push(
                          AppRoutes.rentalDetails,
                          extra: rental.toJson(),
                        );
                      },
                    ),
                  );
                }
                return const Center(
                  child: Text("You have no rentals at the moment"),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.getRentals.completed) {
      widget.viewModel.getRentals.clearResult();
    }
    if (widget.viewModel.getRentals.error) {
      widget.viewModel.getRentals.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("There was an error fetching your rentals"),
        ),
      );
    }
  }
}
