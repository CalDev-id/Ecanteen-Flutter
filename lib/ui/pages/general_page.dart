part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onBackButtonPressed;
  final Widget child;
  final Color backColor;

  const GeneralPage(
      {Key key,
      this.title,
      this.subtitle,
      this.onBackButtonPressed,
      this.child,
      this.backColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        SafeArea(
            child: Container(
          color: backColor ?? Colors.white,
        )),
        SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Row(children: [
                      GestureDetector(
                        onTap: () {
                          if (onBackButtonPressed != null) {
                            onBackButtonPressed();
                          }
                        },
                        child: onBackButtonPressed != null
                            ? Container(
                                width: 24,
                                height: 24,
                                margin: const EdgeInsets.only(right: 26),
                                // ignore: prefer_const_constructors
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                  image: AssetImage('assets/back.png'),
                                )),
                              )
                            : const SizedBox(),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.poppins(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            subtitle,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                color: '8D92A3'.toColor()),
                          ),
                        ],
                      )
                    ]),
                  ),
                  Container(
                    height: defaultMargin,
                    width: double.infinity,
                    color: "FAFAFC".toColor(),
                  ),
                  child ?? SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
