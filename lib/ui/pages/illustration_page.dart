part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picturePath;
  final String buttonTitle1;
  final Function onButtonPressed1;
  final String buttonTitle2;
  final Function onButtonPressed2;

  const IllustrationPage(
      {Key key,
      @required this.buttonTitle1,
      this.buttonTitle2,
      this.onButtonPressed1,
      this.onButtonPressed2,
      @required this.picturePath,
      @required this.subtitle,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 150,
          height: 150,
          margin: const EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(picturePath))),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          subtitle,
          style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: 200,
          height: 45,
          child: RaisedButton(
            onPressed: onButtonPressed1,
            color: mainColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Text(
              buttonTitle1,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Visibility(
          visible: buttonTitle2 != null,
          child: Container(
            width: 200,
            height: 45,
            child: RaisedButton(
              onPressed: onButtonPressed2,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: mainColor)),
              child: Text(
                buttonTitle2 ?? "title",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: mainColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
