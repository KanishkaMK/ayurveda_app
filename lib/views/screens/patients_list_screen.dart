import 'package:ayurveda_app/controller/providers/patient_provider.dart';
import 'package:ayurveda_app/views/screens/registration_screen.dart';
import 'package:ayurveda_app/views/widgets/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientsListScreen extends StatelessWidget {
  // final List<Map<String, String>> patients = [
  //   {
  //     'name': 'Vikram Singh',
  //     'package': 'Couple Combo Package (Rejuvenation)',
  //     'date': '31/01/2024',
  //     'staff': 'Jithesh',
  //     'button': 'View Booking details',
  //   },
  //   {
  //     'name': 'Vikram Singh',
  //     'package': 'Couple Combo Package (Rejuvenation)',
  //     'date': '31/01/2024',
  //     'staff': 'Jithesh',
  //     'button': 'View Booking details',
  //   },
  //   {
  //     'name': 'Vikram Singh',
  //     'package': 'Couple Combo Package (Rejuvenation)',
  //     'date': '31/01/2024',
  //     'staff': 'Jithesh',
  //     'button': 'Register Now',
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        actions: [
          IconButton(
            onPressed: () {
             
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search for treatments',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                DropdownButton<String>(
                  value: 'Date',
                  items: <String>['Date', 'Name']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (value) {
                    // Add sorting functionality
                  },
                ),
              ],
            ),
          ),
          RefreshIndicator(
            onRefresh: () async{ 
              await context.read<PatientProvider>().fetchPatients();
             },
            child: Consumer<PatientProvider>(
              builder: (context,provider, child) { 
                 if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.patients.isEmpty) {
              return const EmptyListWidget();
            }
              return Expanded(
                child: ListView.builder(
                   itemCount: provider.patients.length,
                  itemBuilder: (context, index) {
                    //final patient = patients[index];
                     final patient = provider.patients[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                       // title: Text(patient['name']!),
                         title: Text(patient.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           // Text(patient['package']!),
                           Text(patient.package),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today, size: 16),
                                const SizedBox(width: 4.0),
                                Text(patient.date!),
                                const SizedBox(width: 16.0),
                                const Icon(Icons.person, size: 16),
                                const SizedBox(width: 4.0),
                                Text(patient.staff!),
                              ],
                            ),
                           
                          ],
                        ),
                        // trailing: ElevatedButton(
                        //   onPressed: () {
                        //     // Handle button click
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: patient['button'] == 'Register Now'
                        //         ? Colors.green
                        //         : Colors.blue,
                        //   ),
                        //   child: Text(patient['button']!),
                        // ),
                        trailing: SizedBox(
                          width: 100,
                          child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("View Booking Details"),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                        ),
                    onTap: () {
                      // Handle tap on list tile (e.g., navigate to booking details)
                    },
                      ),
                    );
                  },
                ),
              );
              }
            ),
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen(),));
          }, 
           style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
           ),
          child: Text("REGISTER",
          style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}



