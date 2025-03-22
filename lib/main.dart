import 'package:collarcode/tagScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

// GoRouter configuration

final _router = GoRouter(
  initialLocation:
      "/tag/Bruno/Golder%20Retriever/Aakash/98973642/email@google.com/address",
  routes: [
    GoRoute(
      path:
          '/tag/:petName/:petType/:ownerName/:phoneNumber/:email/:address',
      builder: (context, state) {
        final petName = state.pathParameters['petName']!;
        final petType = state.pathParameters['petType']!;
        final ownerName = state.pathParameters['ownerName']!;
        final phoneNumber = state.pathParameters['phoneNumber']!;
        final email = state.pathParameters['email']!;
        final address = state.pathParameters['address']!;

        return TagScreen(
          petName: petName,
          petType: petType,
          phoneNumber: phoneNumber,
          email: email,
          ownerName: ownerName,
          address: address,
        );
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
