import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         // Image.asset('assets/images/empty_list.png'),
          const SizedBox(height: 16),
          const Text(
            'No patients found',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
