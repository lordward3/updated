import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestWidget extends StatefulWidget {
  TestWidget({
    Key key,
    this.indexParam,
  }) : super(key: key);

  final String indexParam;

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Text(
          widget.indexParam,
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Source Sans Pro',
          ),
        ),
      ),
    );
  }
}
