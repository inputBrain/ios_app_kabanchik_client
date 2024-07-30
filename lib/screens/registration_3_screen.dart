import '../imports.dart';

class Registration3Screen extends StatefulWidget {
  final RegisterUserModel userModel;

  const Registration3Screen({super.key, required this.userModel});

  @override
  _Registration3ScreenState createState() => _Registration3ScreenState();
}

class _Registration3ScreenState extends State<Registration3Screen> {
  bool isNextEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('wwwroot/Images/background.jpg'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: constraints.maxWidth * 0.7,
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color.fromRGBO(70, 172, 166, 1),
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "about the project++",
                        ),
                        Text(
                          "how it works",
                        ),
                        Text(
                          "guarantee and safety",

                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// class InfoColumn extends StatefulWidget {
//   final String title;
//   final String content;
//
//   InfoColumn({required this.title, required this.content});
//
//   @override
//   _InfoColumnState createState() => _InfoColumnState();
// }
//
// class _InfoColumnState extends State<InfoColumn> with SingleTickerProviderStateMixin {
//   bool _isExpanded = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 _isExpanded = !_isExpanded;
//               });
//             },
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       widget.title,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 AnimatedRotation(
//                   turns: _isExpanded ? 0.25 : 0,
//                   duration: Duration(milliseconds: 200),
//                   child: Icon(Icons.keyboard_arrow_right),
//                 ),
//               ],
//             ),
//           ),
//           if (_isExpanded)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Text(widget.content),
//             ),
//         ],
//       ),
//     );
//   }
// }
