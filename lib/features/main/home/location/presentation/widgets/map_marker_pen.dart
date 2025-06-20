import 'package:food_zone/exports.dart';

class MapMarkerPen extends StatelessWidget {
  const MapMarkerPen({super.key});

  @override
  Widget build(BuildContext context) {
    //final image = prefs.userData['user']['avatar']['url'];
    return TextFormField();
    // return SizedBox(
    //   width: context.widthByValue(68),
    //   height: context.widthByValue(68),
    //   child: Stack(
    //     clipBehavior: Clip.none,
    //     children: <Widget>[
    //       Positioned(
    //         bottom: -10,
    //         left: 0,
    //         right: 0,
    //         child: SvgPicture.asset(
    //           FAssets.pen,
    //           width: context.widthByValue(26),
    //           height: context.widthByValue(20),
    //         ),
    //       ),
    //       Container(
    //         padding: const EdgeInsets.all(2),
    //         width: context.widthByValue(68),
    //         height: context.widthByValue(68),
    //         clipBehavior: Clip.hardEdge,
    //         decoration: BoxDecoration(
    //           shape: BoxShape.circle,
    //           color: primaryWhite,
    //           border: Border.all(color: primary500, width: 2),
    //           boxShadow: <BoxShadow>[
    //             BoxShadow(
    //               color: neutral900.withOpacity(.1),
    //               offset: const Offset(0, 1.2),
    //             ),
    //           ],
    //         ),
    //         child: Container(
    //             clipBehavior: Clip.hardEdge,
    //             decoration: const BoxDecoration(shape: BoxShape.circle),
    //             child: ImageLoader(imageUrl: image)),
    //       ),
    //     ],
    //   ),
    // );
  }
}
