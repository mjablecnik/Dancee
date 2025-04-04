import 'package:flutter/cupertino.dart';
import '../../../dancee_design_exports.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.title,
    required this.place,
    required this.since,
    required this.until,
    this.width = 400,
    this.height = 122,
    this.chips = const [],
    this.tooMuchInfo = false,
    this.onTap,
    this.style,
  });

  final String title;
  final String place;
  final double width;
  final double height;
  final DateTime since;
  final DateTime until;
  final bool tooMuchInfo;
  final List<Chip> chips;
  final GestureTapCallback? onTap;
  final EventCardStyle? style;

  Widget leftPart() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 15, bottom: 15),
      child: Container(
        padding: EdgeInsets.only(right: 18),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: AppColors.grey400.withAlpha(50),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${since.day}. ${since.month}.',
              style: TextStyle(
                fontFamily: AppFonts.inter,
                fontWeight: FontWeight.w700,
                fontSize: 19,
                wordSpacing: -2,
              ),
            ),
            Text(
              since.year.toString(),
              style: TextStyle(
                fontFamily: AppFonts.inter,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Od: ${since.hour}:${since.minute < 10 ? '00' : since.minute}',
              style: TextStyle(
                fontFamily: AppFonts.inter,
                fontWeight: FontWeight.w400,
                color: AppColors.grey400,
                fontSize: 11,
              ),
            ),
            Text(
              'Do: ${since.hour}:${since.minute < 10 ? '00' : since.minute}',
              style: TextStyle(
                fontFamily: AppFonts.inter,
                fontWeight: FontWeight.w400,
                color: AppColors.grey400,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget middlePart() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      width: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            place,
            style: TextStyle(
              fontFamily: AppFonts.inter,
              fontWeight: FontWeight.w400,
              color: AppColors.grey400,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 1),
          Text(
            Utils.truncateWithEllipsis(title, 44),
            style: TextStyle(
              fontFamily: AppFonts.inter,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: -0.1,
            ),
          ),
          SizedBox(height: 8),
          if (chips.isEmpty)
            SizedBox(height: 20, width: 190)
          else
            ChipList(
              width: 190,
              padding: EdgeInsets.zero,
              chips: chips,
            ),
        ],
      ),
    );
  }

  Widget rightPart(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 6),
            child: SizedBox(width: 34, height: 34),
            //ImageButton(
            //  onTap: () {},
            //  size: Size(34, 34),
            //  child: Padding(
            //    padding: const EdgeInsets.only(top: 2, left: 1),
            //    child: Icon(Icons.heart_broken, size: 24),
            //  ),
            //),
          ),
          Spacer(),
          Spacer(),
          LinkButton(
            text: "Detail",
            padding: EdgeInsets.only(right: 12),
            onTap: () {},
            leadingIcon: false,
            icon: CupertinoIcons.right_chevron,
            style: context.designTheme.elementsStyle.buttonsStyle.linkButtonStyle.copyWith(
              iconSize: 19,
              textSize: 13,
              iconColor: AppColors.grey400.withAlpha(200),
              textColor: AppColors.grey400,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height + (tooMuchInfo ? 24 : 0),
        decoration: currentStyle.decoration,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                leftPart(),
                constraints.minWidth > 300 ? Expanded(child: middlePart()) : middlePart(),
                rightPart(context),
              ],
            );
          }
        ),
      ),
    );
  }
}
