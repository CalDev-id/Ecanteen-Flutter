part of 'widgets.dart';

class Rating extends StatelessWidget {
  final double rate;

  const Rating({Key key, this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberRate = rate.round();
    return Row(
        children: List<Widget>.generate(
                5,
                (index) => Icon(
                    (index < numberRate) ? MdiIcons.star : MdiIcons.starOutline,
                    size: 16,
                    color: yellow)) +
            [
              const SizedBox(
                width: 4,
              ),
              Text(
                rate.toString(),
                style: greyFontStyle.copyWith(fontSize: 12),
              )
            ]);
  }
}
