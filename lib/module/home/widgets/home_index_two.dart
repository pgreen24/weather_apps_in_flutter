import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/material.dart';

class homeIndexTwo extends StatelessWidget {
  const homeIndexTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.blueGrey.shade50,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud_queue, size: 64, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            "This is Page 2 (homeIndexOne)",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
