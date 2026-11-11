import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:org_fair/screens/about_screen.dart';

void main() {
  testWidgets('About shows the installed package version and build', (
    tester,
  ) async {
    PackageInfo.setMockInitialValues(
      appName: 'CICT Org Fair',
      packageName: 'org_fair',
      version: '1.1.0',
      buildNumber: '2',
      buildSignature: '',
    );
    await tester.pumpWidget(const MaterialApp(home: AboutScreen()));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byType(VersionTile));
    expect(find.text('Version 1.1.0 (build 2)'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
