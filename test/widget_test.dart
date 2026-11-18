import 'package:flutter_test/flutter_test.dart';
import 'package:project_pas/main.dart';

void main() {
  testWidgets('app starts on login page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.text('Masuk ke Project PAS'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
  });
}
