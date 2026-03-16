import 'package:flutter_test/flutter_test.dart';

import 'package:shiv_portfolio/main.dart';

void main() {
  testWidgets('Responsive portfolio home renders key sections',
      (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('Shivpal Singh'), findsOneWidget);
    expect(find.text('Senior Mobile Developer'), findsOneWidget);
    expect(find.text('About me'), findsOneWidget);
    expect(find.text('Projects'), findsOneWidget);
  });
}
