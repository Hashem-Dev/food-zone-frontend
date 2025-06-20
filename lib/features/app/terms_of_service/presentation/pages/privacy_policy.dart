import 'package:food_zone/exports.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const GradientAppbarTitle(title: 'Privacy Policy'),
      ),
      body: ResponsiveLayout(
        portrait: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextSection(context, '1- Information We Collect:'),
              addVerticalSpace(8),
              _buildSectionItem(
                title: '- Geolocation',
                details: [
                  'We collect your location to show nearby restaurants Collected via [GPS].',
                  'Data is shared only with restaurants/delivery partners.',
                ],
              ),
              _buildSectionItem(
                title: '- Account Info:',
                details: [
                  'Name, email, phone number provided during registration.',
                  'If using Google login, we access only authorized data.',
                ],
              ),
              _buildSectionItem(
                title: '- Payment Data:',
                details: [
                  'We use secure gateways (Stripe), we do not store your card details.',
                ],
              ),
              addVerticalSpace(10),
              _buildTextSection(context, '2- Data Usage:'),
              _buildSectionItem(
                details: [
                  'Improve app functionality and show personalized offers.',
                  'Communicate order updates or promotions (opt-out available anytime).',
                ],
              ),
              _buildTextSection(context, '3- Data Sharing:'),
              _buildSectionItem(
                details: [
                  'Order details are shared with restaurants/delivery services.',
                  'We do not sell your data to third parties for marketing.',
                ],
              ),
              _buildTextSection(context, '4- Your Rights:'),
              _buildSectionItem(
                details: [
                  'Delete your account or correct data via [Account Settings/Support].',
                  'Disable location sharing via device settings.',
                ],
              ),
              _buildTextSection(context, '5- Security:'),
              _buildSectionItem(
                details: [
                  'Data is encrypted using protocols like SSL.',
                ],
              ),
              _buildTextSection(context, '6- Updates:'),
              _buildSectionItem(
                details: [
                  'We’ll notify you of policy changes via [email/in-app notifications].',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildTextSection(BuildContext context, String title) {
    return Text(
      title,
      style: context.textStyle.titleLarge!.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

Widget _buildSectionItem({
  String title = '',
  required List<String> details,
  Color titleColor = primary500,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != '')
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: titleColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ...details.map(
        (detail) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Text(detail),
        ),
      ),
      addVerticalSpace(10),
    ],
  );
}
