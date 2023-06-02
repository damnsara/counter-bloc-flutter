import 'package:bloc_practice2/app_bloc.dart';
import 'package:bloc_practice2/app_events.dart';
import 'package:bloc_practice2/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:bloc_practice2/pages/sign_in/sign_in.dart';
import 'package:bloc_practice2/pages/welcome/bloc/welcome_blocs.dart';
import 'package:bloc_practice2/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_state.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
            lazy: false,
            create: (context) => AppBloc()
        ),
        BlocProvider(create: (context) => SignInBloc())
      ],
      child: ScreenUtilInit(
        builder: (context, child) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Welcome(),
              routes: {
                "myHomePage":(context) => const MyHomePage(),
                "signIn":(context) => const SignIn(),
              },
            ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Flutter Demo Home Page"),
      ),
      body: Center(
        child: BlocBuilder<AppBloc, AppStates>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    "${BlocProvider.of<AppBloc>(context).state.counter}",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                ],
              );
            }
    ),
    ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "heroTag1",
            onPressed: () => BlocProvider.of<AppBloc>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: "heroTag2",
            onPressed: () => BlocProvider.of<AppBloc>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),

        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
