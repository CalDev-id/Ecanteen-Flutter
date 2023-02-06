part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  CustomTabBar({Key key, this.titles, this.onTap, this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 48),
            height: 1,
            color: "F2F2F2".toColor(),
          ),
          Row(
            children: titles
                .map((e) => Padding(
                      padding: const EdgeInsets.only(left: defaultMargin),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (() {
                              onTap(titles.indexOf(e));
                            }),
                            child: Text(
                              e,
                              style: (titles.indexOf(e) == selectedIndex)
                                  ? GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)
                                  : GoogleFonts.poppins(
                                      color: greyColor, fontSize: 15),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 3,
                            margin: const EdgeInsets.only(top: 13),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.5),
                                color: (titles.indexOf(e) == selectedIndex)
                                    ? "020202".toColor()
                                    : Colors.transparent),
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
