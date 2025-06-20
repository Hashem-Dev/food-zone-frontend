import 'package:food_zone/core/global_widgets/animated_over_flow_text.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/product_rating/presentation/manager/image_picker_rating.dart';
import 'package:food_zone/features/product/product_rating/presentation/manager/rating_bar.dart';
import 'package:food_zone/features/product/product_rating/presentation/widgets/image_picker_buttons.dart';
import 'package:food_zone/features/product/product_rating/presentation/widgets/picked_image.dart';
import 'package:food_zone/features/product/product_rating/presentation/widgets/rating_bar_indicator.dart';
import 'package:food_zone/features/product/product_rating/presentation/widgets/review_text_field.dart';
import 'package:food_zone/features/product/product_rating/presentation/widgets/success_rating.dart';

class ProductRatingView extends StatelessWidget {
  const ProductRatingView({
    super.key,
    required this.type,
    required this.title,
    required this.id,
  });

  final String type;
  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    final pickerImageController = Get.put(ImagePickerRatingController());
    final ratingController = Get.put(RatingBarController());
    final bool isDark = context.brightness == Brightness.dark;
    ratingController.setProductDetails(type: type, title: title, id: id);
    return Scaffold(
      appBar: _buildCustomAppBar(context),
      body: ResponsiveLayout(
        portrait: LayoutBuilder(builder: (context, constraints) {
          return Obx(() {
            final bool rating = ratingController.rating > 0;
            final loading = ratingController.loading;
            return loading
                ? const Loading()
                : SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Rate your Experience',
                            style: context.textStyle.displaySmall!.copyWith(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Image.asset(
                            FAssets.diamond,
                            width: 160.w,
                            height: 160.h,
                          ),
                          Column(
                            children: <Widget>[
                              const ProductRatingBarIndicator(),
                              addVerticalSpace(24),
                              buildTextReviewField(rating, isDark, context),
                              addVerticalSpace(24),
                              _buildSubmitButton(
                                rating,
                                ratingController,
                                pickerImageController,
                                context,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
          });
        }),
      ),
    );
  }

  AppBar _buildCustomAppBar(BuildContext context) {
    return AppBar(
      title: SizedBox(
        height: AppBar().preferredSize.height / 2,
        child: OverFlowAnimatedText(
          text: '$title Rating',
          textStyle: context.textStyle.displaySmall!.copyWith(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildTextReviewField(
      bool rating, bool isDark, BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      duration: const Duration(milliseconds: 300),
      height: rating ? 180.h : 0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: isDark
            ? primaryWhite.withValues(alpha: .1)
            : blackBottomSheet.withValues(alpha: .05),
      ),
      child: SingleChildScrollView(
        child: SizedBox(
          height: context.heightByValue(180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: ReviewTextField(),
              ),
              const ReviewPickedImage(),
              const ImagePickerButtons(),
              addVerticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }

  FButton _buildSubmitButton(bool rating, RatingBarController ratingController,
      ImagePickerRatingController pickerImageController, BuildContext context) {
    return FButton(
      size: true,
      title: 'Submit',
      onPressed: rating
          ? () async {
              ratingController.changeLoadingState(true);
              final imageUrl =
                  await pickerImageController.uploadImageToCloudinary();
              final isRated = await ratingController
                  .addProductRating(images: ['$imageUrl']);
              if (isRated && context.mounted) {
                showSuccessProductRating(context);
              }
            }
          : null,
    );
  }
}
