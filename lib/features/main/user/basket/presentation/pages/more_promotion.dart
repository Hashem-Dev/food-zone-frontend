import 'package:food_zone/exports.dart';

class MorePromotionView extends StatelessWidget {
  const MorePromotionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get More Promotions',
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ResponsiveLayout(
        portrait: ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, index) {
            final Map<String, dynamic> option = options[index];

            return Container(
              margin: EdgeInsets.only(bottom: context.heightByValue(12)),
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              height: context.heightByValue(68),
              width: context.width,
              decoration: BoxDecoration(
                color: context.isDarkMode ? neutral600 : primaryWhite,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  width: 1,
                  color: context.isDarkMode ? neutral400 : neutral50,
                ),
              ),
              child: Center(
                child: ListTile(
                  dense: false,
                  visualDensity: VisualDensity.comfortable,
                  leading: SvgPicture.asset(
                    option['icon'],
                    width: context.widthByValue(30),
                  ),
                  title: Text(
                    option['title'],
                    style: context.textStyle.displaySmall!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: neutral100,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

const List<Map<String, dynamic>> options = [
  {'title': 'Share App', 'icon': FAssets.share},
  {'title': 'Invite Friends', 'icon': FAssets.userGroup},
  {'title': 'Complete Profile', 'icon': FAssets.userCircle},
  {'title': 'Follow Social Media', 'icon': FAssets.socialSharing},
  {'title': 'Take Surveys', 'icon': FAssets.takeSurvey},
];
