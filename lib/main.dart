import 'package:collarcode/tagScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'creatorScreen.dart';
void main() {
  runApp(MyApp());
}


final _router = GoRouter(
  initialLocation: "/",
  //  "/#/tag/Bruno/Golder%20Retriever/Aakash/98973642/email@google.com/address",
  // "/build",
  routes: [
    GoRoute(
      path: '/tag/:petName/:petType/:ownerName/:phoneNumber/:email/:address',
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
    GoRoute(
        path: "/",
        builder: (context, state) {
          return CreatorScreen();
        }),
  ],
 // errorBuilder: (context, state) => Scaffold(
 //   body: Center(
 //     child: Column(
 //       mainAxisAlignment: MainAxisAlignment.center,
 //       children: [
 //         Text(
 //           '404 - Page Not Found',
 //           style: TextStyle(fontSize: 24),
 //         ),
 //         SizedBox(height: 16),
 //         Text(
 //             'The requested page "${state.uri.toString()}" could not be found.'),
 //         SizedBox(height: 16),
 //         ElevatedButton(
 //           onPressed: () => context.go('/'),
 //           child: Text('Go to Home'),
 //         ),
 //       ],
 //     ),
 //   ),
 // ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
