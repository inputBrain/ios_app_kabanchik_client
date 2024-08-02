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
                        fontWeight: FontWeight.bold,
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

                      child: const SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text('If you access or use the Services within a jurisdiction for which there are special additional terms, you also agree to those additional terms applicable to users in each jurisdiction, as set forth below, and in the event of a conflict between the provisions of the Additional Terms - For Specific Jurisdiction that relate to the jurisdiction in which you access or use the services and the rest of this Agreement, the corresponding Additional Terms - For Specific Jurisdiction will apply. If you do not agree to these Terms, you should not access or use our Services.If you access or use the Services on behalf of a company or organization, then (a) "you" and "your" includes the legal entity or organization, (b) you represent and warrant that you are an authorized representative of the legal entity or organization with authority to accept the terms of this user artreement and agree to them on its behalf, and (c) your legal entity or organization is legally and financially responsible for accessing or using our services, as well as for access to or use of your account by other individuals associated with your organization, including employees, agents, or contractors. By accessing or using our Services, you accept the terms of this User Agreement. You understand and agree that from this moment forward, we will consider your access to our services or their use as acceptance of the terms of this User Agreement. You need to print or save a local copy of the user agreement for yourself.',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Rokkitt',
                                fontWeight: FontWeight.bold
                              ),
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