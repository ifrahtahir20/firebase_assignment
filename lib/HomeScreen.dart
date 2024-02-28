// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MyListItem> items = [
    MyListItem(
      title: '100% Free',
      subtitle: 'Udhaar App is free forever',
      leadingIcon: Icons.account_circle,
    ),
    MyListItem(
      title: '100% Secure',
      subtitle: 'Totally safe and secure',
      leadingIcon: Icons.safety_check_sharp,
    ),
    MyListItem(
      title: 'Secure Backup',
      subtitle: 'Your data is always protected ',
      leadingIcon: Icons.cloud_done,
    ),
  ];
  @override
  void initState() {
    Future.delayed(Duration(seconds: 10), () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(100),
              child: Image.asset(
                "assets/images/screen_image.png",
                width: 150,
                height: 150,
              ),
            ),
            Container(
              //   padding: EdgeInsets.only(left: 10),
              //  alignment: Alignment.center,
              child: Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(items[index].leadingIcon),
                      title: Text(items[index].title,
                          style: TextStyle(
                            color: Colors.deepPurple.shade700,
                          )
                          //   TextStyle(color: Color.fromRGBO(59, 12, 54, 255)),
                          //HexColor("#3b0c36")
                          ),
                      subtitle: Text(items[index].subtitle),
                    );
                  },
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [Text("Buckle Down And Push Forth! ")],
            // )
          ],
        ),
      ),
    );
  }
}

class MyListItem {
  final String title;
  final String subtitle;
  final IconData leadingIcon;

  MyListItem({
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
  });
}
