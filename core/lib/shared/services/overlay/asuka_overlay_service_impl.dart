import 'package:asuka/asuka.dart' as asuka;
import 'package:tads_design_system/tads_design_system.dart';

import 'i_overlay_service.dart';

class AsukaOverlayServiceImpl implements IOverlayService {
  @override
  Future<void> showSuccessSnackBar(String content) async {
    final snackBar = TADSCustomSnackBar.success(content);

    asuka.showSnackBar(snackBar);
  }

  @override
  Future<void> showErrorSnackBar(String content) async {
    final snackBar = TADSCustomSnackBar.error(content);

    asuka.showSnackBar(snackBar);
  }
}
