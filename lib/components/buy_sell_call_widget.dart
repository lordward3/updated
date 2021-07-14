import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuySellCallWidget extends StatefulWidget {
  BuySellCallWidget({Key key}) : super(key: key);

  @override
  _BuySellCallWidgetState createState() => _BuySellCallWidgetState();
}

class _BuySellCallWidgetState extends State<BuySellCallWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Color(0xFFF5F5F5),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Buy/Sell/Hold call',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Source Sans Pro',
                          color: FlutterFlowTheme.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        getCurrentTimestamp.toString(),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Source Sans Pro',
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text(
                    'Description in brief??....Description in brief??....Description in brief??....Description in brief??....Description in brief??....',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
