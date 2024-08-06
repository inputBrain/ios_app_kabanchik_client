import '../imports.dart';

class ScreenNavigationWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isFurtherEnabled;

  const ScreenNavigationWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.isFurtherEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 40,
      decoration: BoxDecoration(
        color: isFurtherEnabled
            ? const Color.fromRGBO(116, 192, 188, 1)
            : const Color.fromRGBO(203, 233, 233, 1),
        borderRadius: BorderRadius.zero,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
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
    );
  }
}