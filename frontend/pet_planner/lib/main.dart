import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'package:flutter/services.dart';
import 'package:pet_planner/pages/event_provider.dart';
import 'package:provider/provider.dart';
import 'pages/schedule_page.dart';

const appScheme = 'flutterdemo';

/// -----------------------------------
///           Profile Widget
/// -----------------------------------

class Profile extends StatelessWidget {
  final Future<void> Function() logoutAction;
  final UserProfile? user;

  const Profile(this.logoutAction, this.user, {final Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 4),
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(user?.pictureUrl.toString() ?? ''),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text('Name: ${user?.name}'),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: () async {
            await logoutAction();
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}

/// -----------------------------------
///            Login Widget
/// -----------------------------------

class Login extends StatelessWidget {
  final Future<void> Function() loginAction;
  final String loginError;

  const Login(this.loginAction, this.loginError, {final Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () async {
            await loginAction();
          },
          child: const Text('Login'),
        ),
        Text(loginError ?? ''),
      ],
    );
  }
}

/// -----------------------------------
///                 App
/// -----------------------------------

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    // DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  _MyAppState createState() => _MyAppState();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ));
}

/// -----------------------------------
///              App State
/// -----------------------------------

class _MyAppState extends State<MyApp> {
  bool isBusy = false;
  late String errorMessage;
  Credentials? _credentials;
  late Auth0 auth0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => EventProvider(),
        child: MaterialApp(
            title: 'Pet Planner',
            home: Scaffold(
              body: Center(
                child: isBusy
                    ? const CircularProgressIndicator()
                    : _credentials != null
                        // Skip Login
                        // ? SchedulePage()
                        // : Login(loginAction, errorMessage),

                        // Login to profile widget
                        ? SchedulePage()
                        // ? Profile(logoutAction, _credentials?.user)
                        : Login(loginAction, errorMessage),

                // Login to Schedule Page - Broken (no context)
                // ? SchedulePage()
                // : Login(loginAction, errorMessage),
              ),
            )));
  }

  Future<void> loginAction() async {
    setState(() {
      isBusy = true;
      errorMessage = '';
    });

    try {
      final Credentials credentials =
          await auth0.webAuthentication(scheme: appScheme).login();

      setState(() {
        isBusy = false;
        _credentials = credentials;
      });
    } on Exception catch (e, s) {
      debugPrint('login error: $e - stack: $s');

      setState(() {
        isBusy = false;
        errorMessage = e.toString();
      });
    }
  }

  Future<void> logoutAction() async {
    await auth0.webAuthentication(scheme: appScheme).logout();

    setState(() {
      _credentials = null;
    });
  }

  void initState() {
    super.initState();

    auth0 = Auth0('dev-4ei56cif3obs4i6c.us.auth0.com',
        'Wg8cmgyF0ySjqII2CppKyfBYOkVXrMXF');
    errorMessage = '';
  }
}
