import 'package:flutter/material.dart';
import 'package:hellonotes/constants/routes.dart';
import 'package:hellonotes/views/login_view.dart';
import 'package:hellonotes/views/notes_view.dart';
import 'package:hellonotes/views/register_view.dart';
import 'package:hellonotes/views/verify_email_view.dart';
import 'dart:developer' as devtools show log;
import 'package:hellonotes/services/auth/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );
AuthService.firebase().initialize();

  runApp(MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        loginRoute: (context) => const LoginView(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginView()));
}



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user =AuthService.firebase().currentUser;

            if (user != null) {
              if (user.isEmailVerfied) {
                devtools.log("Verified User");
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
            return const Text("Done");

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}


