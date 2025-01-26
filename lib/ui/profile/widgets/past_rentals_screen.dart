import 'package:automaat_app/ui/profile/view_models/past_rentals_viewmodel.dart';
import 'package:flutter/material.dart';

class PastRentalsScreen extends StatefulWidget {
  const PastRentalsScreen({super.key, required this.viewModel});

  final PastRentalsViewModel viewModel;

  @override
  State<PastRentalsScreen> createState() => _PastRentalsScreenState();
}

class _PastRentalsScreenState extends State<PastRentalsScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getRentals.addListener(_onResult);
    if (widget.viewModel.rentals.isEmpty) {
      widget.viewModel.getRentals.execute();
    }
  }

  @override
  void didUpdateWidget(covariant PastRentalsScreen oldWidget) {
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
        title: const Text("Past rentals"),
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
                    child: ListView.builder(
                      itemCount: rentals.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = rentals[index];
                        return Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.car_rental),
                                title: Text(
                                    "${item.car?.brand} ${item.car?.model}(${item.car?.modelYear})"),
                                subtitle: Text(
                                    "From: ${item.fromDate} to ${item.toDate}"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return const Center(
                  child: Text("There was an error fetching your past rentals"),
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
          content: Text("There was an issue retrieving your past rentals"),
        ),
      );
    }
  }
}
