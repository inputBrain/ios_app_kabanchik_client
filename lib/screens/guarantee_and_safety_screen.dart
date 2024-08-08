import '../imports.dart';

class GuaranteeAndSafetyScreen extends StatelessWidget {
  const GuaranteeAndSafetyScreen({super.key});

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
                      'Guarantee and Safety',
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
                                  'We are a communication platform, bringing together and facilitating contact between service seekers and service providers. We recommend not to disclose your personal and banking information to third parties. We suggest agreeing on the cost of services/work before commencement, also clarify if materials or consumables are included in the cost. Do not pay money in advance, only upon completion of work/services. The purchase of materials is agreed upon individually. Check the rating and reviews of the service provider; this often indicates reliability and quality of work. All other terms and instructions are outlined in the User Agreement.',
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