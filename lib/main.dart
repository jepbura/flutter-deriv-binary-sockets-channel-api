import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_picker/utils/utils.dart';
import 'di/di.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'features/presentation/manager/manager.dart';
import 'features/presentation/pages/pages.dart';

Future<void> main() async {
  /// Register Service locator
  await serviceLocator();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
        BlocProvider(
          create: (context) => sl<SocketCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<SymbolsCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<TicksCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: buildShrineTheme(),
        home: const PricePickerScreen(),
      ),
    );
  }
}
