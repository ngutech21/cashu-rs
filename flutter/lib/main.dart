import 'package:moksha_wallet/pages/pay_invoice_page.dart';
import 'package:moksha_wallet/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:moksha_wallet/pages/mint_page.dart';
import 'package:moksha_wallet/pages/overview_page.dart';
import 'package:moksha_wallet/pages/receive_page.dart';
import 'package:moksha_wallet/ffi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbPathProvider = FutureProvider<String>((ref) async {
  return await api.initCashu();
});

void main() {
  //await myErrorsHandler.initialize();
  // FlutterError.onError = (details) {
  //   FlutterError.presentError(details);
  //   myErrorsHandler.onErrorDetails(details);
  // };
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   myErrorsHandler.onError(error, stack);
  //   return true;
  // };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    // In release builds, show a yellow-on-blue message instead:
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center,
            width: 250,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber[300],
              boxShadow: const [
                BoxShadow(color: Colors.green, spreadRadius: 3),
              ],
            ),
            child: Text(
              ' Error!\n ${details.exception}',
              style: const TextStyle(color: Colors.red, fontSize: 20),
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
      ),
    );
  };

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(dbPathProvider); // this is a hack to trigger the provider
    return MaterialApp(
      title: 'Moksha e-cash Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(253, 2, 133, 240),
          secondary: Color.fromARGB(253, 2, 133, 240),
          //background: Color.fromARGB(80, 103, 102, 102),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    //_initCashuWallet();
  }

  // Future<void> _initCashuWallet() async {
  //   var dbPath = await api.initCashu();
  // }

  List<Widget> createWidget() {
    return <Widget>[
      const Text("Home"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(toolbarHeight: 50, actions: <Widget>[
      //   IconButton(
      //       icon: const Icon(Icons.settings),
      //       tooltip: 'Settings',
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (context) => const SettingsPage(),
      //           ),
      //         );
      //       })
      // ]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            tooltip: '',
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            tooltip: '',
            icon: Icon(Icons.currency_bitcoin),
            label: 'Mint',
          ),
          NavigationDestination(
            tooltip: '',
            icon: Icon(Icons.import_export),
            label: 'Receive',
          ),
          NavigationDestination(
            tooltip: '',
            icon: Icon(Icons.bolt),
            label: 'Pay',
          ),
          NavigationDestination(
            tooltip: '',
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          alignment: Alignment.center,
          child: const OverviewPage(),
        ),
        Container(
          alignment: Alignment.center,
          child: const MintPage(),
        ),
        Container(
          alignment: Alignment.center,
          child: const ReceivePage(),
        ),
        Container(
          alignment: Alignment.center,
          child: const PayInvoicePage(),
        ),
        Container(
          alignment: Alignment.center,
          child: const SettingsPage(),
        ),
      ][currentIndex],
    );
  }
}
