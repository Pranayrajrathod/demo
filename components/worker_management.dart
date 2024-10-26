import 'package:flutter/material.dart';

class WorkerManagement extends StatelessWidget {
  final List<Map<String, dynamic>> workers;

  const WorkerManagement({super.key, required this.workers});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Worker Management',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20,
                columns: const [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Tasks Completed')),
                ],
                rows: workers.map((worker) {
                  return DataRow(
                    cells: [
                      DataCell(Text(worker['name'])),
                      DataCell(
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getStatusColor(worker['status']),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(worker['status'], style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      DataCell(Text(worker['tasksCompleted'].toString())),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Active':
        return Colors.green;
      case 'Inactive':
        return Colors.red;
      case 'On Break':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}