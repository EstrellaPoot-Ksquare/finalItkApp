import 'package:final_itk_app/core/utils/snackbar_manager.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintAuth {
  final LocalAuthentication auth = LocalAuthentication();
  // ···
  authenthicationPossibility(context) async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    if (!canAuthenticateWithBiometrics || !canAuthenticate) {
      return false;
    }
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    print(availableBiometrics);
    if (!availableBiometrics.contains(BiometricType.strong)) {
      return false;
    }
    // Some biometrics are enrolled.
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to show you great series',
        options: const AuthenticationOptions(biometricOnly: true),
      );
      if (didAuthenticate) {
        SnackbarManager()
            .displaySnackbar(context, 'Successfully authenticated');
      }
    } catch (e) {
      print('error: $e');
    }
  }
}
