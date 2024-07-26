import '../imports.dart';

class ScreenNavigationWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isFurtherEnabled;

  const ScreenNavigationWidget({
    Key? key,
    required this.text,
    this.onPressed,
    this.isFurtherEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55.0, vertical: 73.0),
      child: Container(
        width: 110,
        height: 50,
        decoration:  BoxDecoration(
          color: isFurtherEnabled
              ? const Color.fromRGBO(116, 192, 188, 1)
              : const Color.fromRGBO(203, 233, 233, 1),
          borderRadius: BorderRadius.zero,
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
            backgroundColor: Colors.transparent,
          ),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Rokkitt'
            ),
          ),
        ),
      ),
    );
  }
}