import '/flutter_flow/flutter_flow_util.dart';
import 'onboard_user_widget.dart' show OnboardUserWidget;
import 'package:flutter/material.dart';

class OnboardUserModel extends FlutterFlowModel<OnboardUserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for surName widget.
  FocusNode? surNameFocusNode;
  TextEditingController? surNameController;
  String? Function(BuildContext, String?)? surNameControllerValidator;
  // State field(s) for gender widget.
  FocusNode? genderFocusNode;
  TextEditingController? genderController;
  String? Function(BuildContext, String?)? genderControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    displayNameFocusNode?.dispose();
    displayNameController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    surNameFocusNode?.dispose();
    surNameController?.dispose();

    genderFocusNode?.dispose();
    genderController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
