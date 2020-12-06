import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'src/method_channel_iabtcf_consent_Info.dart';

/// Platform interface fo the IAB TCF consent info plugin.
abstract class IabtcfConsentInfoPlatform extends PlatformInterface {
  /// Constructor to enforce that implementation extend
  /// [IabtcfConsentInfoPlatform].
  IabtcfConsentInfoPlatform() : super(token: _token);

  static IabtcfConsentInfoPlatform _instance = MethodChannelIabtcfConsentInfo();

  static const Object _token = Object();

  /// The platform specific implementation of [IabtcfConsentInfoPlatform].
  static IabtcfConsentInfoPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [IabtcfConsentInfoPlatform] when they register
  /// themselves.
  static set instance(IabtcfConsentInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Request from the platform implementation that it starts to send updates
  /// when the consent information changes. The platform implementation must
  /// send one initial updated after receiving this request.
  ///
  /// The returned stream emits the raw IABTCF consent information (every key
  /// starts with `IABTCF_`).
  Stream<Map<String, dynamic>> startSendingUpdates();
}
