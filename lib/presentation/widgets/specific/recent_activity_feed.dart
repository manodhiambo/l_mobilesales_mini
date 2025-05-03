import 'package:flutter/material.dart';

class RecentActivityFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5, // Replace with dynamic data
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Transaction #$index'),
          subtitle: Text('Customer: John Doe, Amount: \$200'),
          onTap: () {},
        );
      },
    );
  }
}
