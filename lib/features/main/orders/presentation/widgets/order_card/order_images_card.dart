import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/models/orders.dart';

class OrderImagesCard extends StatelessWidget {
  const OrderImagesCard({super.key, required this.images});

  final List<OrderImages> images;

  @override
  Widget build(BuildContext context) {
    final deviceRatio = View
        .of(context)
        .devicePixelRatio;
    return Stack(
      children: List.generate(
        images.length,
            (index) {
          final OrderImages image = images[index];
          return Positioned(
            child: Container(
              margin: EdgeInsets.only(left: (index * 15.w)),
              height: context.widthByValue(75),
              width: context.widthByValue(75),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: context.isDarkMode ? neutral700 : primaryWhite,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  width: 2,
                  color: context.isDarkMode ? neutral700 : primaryWhite,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    image.url,
                    maxHeight:
                    (context.heightByValue(100) * deviceRatio).round(),
                    maxWidth: (context.widthByValue(100) * deviceRatio).round(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
