import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
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
  String? _displayNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  String? _firstNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for surName widget.
  FocusNode? surNameFocusNode;
  TextEditingController? surNameController;
  String? Function(BuildContext, String?)? surNameControllerValidator;
  String? _surNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  String? _phoneNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 12) {
      return 'Maximum 12 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for genderPick widget.
  String? genderPickValue;
  FormFieldController<String>? genderPickValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    displayNameControllerValidator = _displayNameControllerValidator;
    firstNameControllerValidator = _firstNameControllerValidator;
    surNameControllerValidator = _surNameControllerValidator;
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    displayNameFocusNode?.dispose();
    displayNameController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    surNameFocusNode?.dispose();
    surNameController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
