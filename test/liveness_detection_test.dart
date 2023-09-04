import 'package:flutter_test/flutter_test.dart';
import 'package:liveness_detection/liveness_detection.dart';
import 'package:liveness_detection/liveness_detection_platform_interface.dart';
import 'package:liveness_detection/liveness_detection_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLivenessDetectionPlatform
    with MockPlatformInterfaceMixin
    implements LivenessDetectionPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LivenessDetectionPlatform initialPlatform = LivenessDetectionPlatform.instance;

  test('$MethodChannelLivenessDetection is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLivenessDetection>());
  });

  test('getPlatformVersion', () async {
    LivenessDetection livenessDetectionPlugin = LivenessDetection();
    MockLivenessDetectionPlatform fakePlatform = MockLivenessDetectionPlatform();
    LivenessDetectionPlatform.instance = fakePlatform;

    expect(await livenessDetectionPlugin.getPlatformVersion(), '42');
  });
}
