import '../imports.dart';

class TermsOfServiceScreen extends StatelessWidget {

  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: constraints.maxHeight * 0.01),
                    child: Text(
                      'User Agreement',
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.07,
                        fontFamily: 'Rokkitt',
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Expanded(

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

                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Content',
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'Rokkitt'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ),


                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.05,
                      vertical: constraints.maxHeight * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ScreenNavigationWidget(text: 'back', onPressed: () {
                          Navigator.pop(context);
                        }),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}