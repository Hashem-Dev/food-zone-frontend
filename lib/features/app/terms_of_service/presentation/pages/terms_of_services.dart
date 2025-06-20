import 'package:food_zone/exports.dart';

class TermsOfServices extends StatelessWidget {
  const TermsOfServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const GradientAppbarTitle(title: 'Terms of Services'),
      ),
      body: ResponsiveLayout(
        portrait: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildTextSection(context, '1- Eligibility:'),
            addVerticalSpace(8),
            _buildSectionItem(
              details: [
                '- You must be above [13/18] years old to use the app.',
                '- Illegal activities or copyright violations are prohibited.',
              ],
            ),
            _buildTextSection(context, '2-  Orders & Payments:'),
            _buildSectionItem(
              details: [
                '- Prices may vary by restaurant or region.',
                '- Orders can be canceled before payment confirmation.',
                '- Food quality is the restaurant’s responsibility.',
              ],
            ),
            _buildTextSection(context, '3-  Liability:'),
            _buildSectionItem(
              details: [
                'Food-Zone is not liable for delivery delays or order errors.',
              ],
            ),
            addVerticalSpace(10),
            _buildTextSection(context, '3- Account Suspension:'),
            _buildSectionItem(
              details: [
                'We reserve the right to suspend accounts violating terms without notice.',
              ],
            ),
            _buildTextSection(context, '4- Updates:'),
            _buildSectionItem(
              details: [
                'The app may temporarily shut down for maintenance or updates.',
              ],
            ),
          ]),
        ),
      ),
    );
  }
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

Widget _buildSectionItem({required List<String> details}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
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
