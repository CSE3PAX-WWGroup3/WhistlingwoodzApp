import '/flutter_flow/flutter_flow_util.dart';
import 'sent_message_widget.dart' show SentMessageWidget;
import 'package:flutter/material.dart';

class SentMessageModel extends FlutterFlowModel<SentMessageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
