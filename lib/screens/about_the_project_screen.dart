import '../imports.dart';

class AboutTheProjectScreen extends StatelessWidget {
  const AboutTheProjectScreen({super.key});

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
                      'About the project++',
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.07,
                        fontFamily: 'Rokkitt',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 2,
                              // left straight line size
                              height: constraints.maxHeight * 0.5,
                              color: const Color.fromRGBO(70, 172, 166, 1),
                            ),
                          ),
                          Center(
                            child: SingleChildScrollView(
                              child: Padding(
                                // padding from left side and right side
                                padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
                                child: const Text(
                                  'This is the plusPLUS project, designed to simplify the household tasks we face every day. On our communication platform, you can find a handyman to fix your tap, change a light bulb, paint your walls, and much more, or find a driver to help you move to a new place. Our project is what everyone needs. We have developed a service that is convenient and understandable to everyone, and we improve the service for you every day. And this project is created with love :)',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Rokkitt',
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth * 0.05,
                      right: constraints.maxWidth * 0.05,
                      bottom: constraints.maxHeight * 0.1,
                      top: constraints.maxHeight * 0.05,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ScreenNavigationWidget(
                        text: 'back',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
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