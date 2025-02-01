import 'package:ayurveda_app/views/widgets/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/providers/patient_provider.dart';


class PatientsListScreen extends StatelessWidget {
  const PatientsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patients List')),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<PatientProvider>().fetchPatients();
        },
        child: Consumer<PatientProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.patients.isEmpty) {
              return const EmptyListWidget();
            }

            return ListView.builder(
              itemCount: provider.patients.length,
              itemBuilder: (context, index) {
                final patient = provider.patients[index];
                return ListTile(
                  title: Text(patient.name),
                  subtitle: Text(patient.package),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text(patient.button),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
