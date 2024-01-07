import '/flutter_flow/flutter_flow_util.dart';
import 'client_help_widget.dart' show ClientHelpWidget;
import 'package:flutter/material.dart';

class ClientHelpModel extends FlutterFlowModel<ClientHelpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageController;
  String? Function(BuildContext, String?)? messageControllerValidator;
  // Stores action output result for [Custom Action - getAdminEmails] action in Button widget.
  String? audience;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    messageFocusNode?.dispose();
    messageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
