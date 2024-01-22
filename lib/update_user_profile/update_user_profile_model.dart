import '/flutter_flow/flutter_flow_util.dart';
import 'update_user_profile_widget.dart' show UpdateUserProfileWidget;
import 'package:flutter/material.dart';

class UpdateUserProfileModel extends FlutterFlowModel<UpdateUserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for displaName widget.
  FocusNode? displaNameFocusNode;
  TextEditingController? displaNameController;
  String? Function(BuildContext, String?)? displaNameControllerValidator;
  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for surname widget.
  FocusNode? surnameFocusNode;
  TextEditingController? surnameController;
  String? Function(BuildContext, String?)? surnameControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    displaNameFocusNode?.dispose();
    displaNameController?.dispose();

    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    surnameFocusNode?.dispose();
    surnameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
