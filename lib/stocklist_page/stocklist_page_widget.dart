import '../art_piece_page/art_piece_page_widget.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../individual_stock_page/individual_stock_page_widget.dart';
import '../main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StocklistPageWidget extends StatefulWidget {
  StocklistPageWidget({
    Key key,
    this.indexParam,
  }) : super(key: key);

  final String indexParam;

  @override
  _StocklistPageWidgetState createState() => _StocklistPageWidgetState();
}

class _StocklistPageWidgetState extends State<StocklistPageWidget> {
  String dropDownValue;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavBarPage(initialPage: 'HomeIndexPage'),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: FlutterFlowTheme.secondaryColor,
            size: 24,
          ),
        ),
        title: Text(
          widget.indexParam,
          style: FlutterFlowTheme.bodyText2.override(
            fontFamily: 'Source Sans Pro',
            color: FlutterFlowTheme.secondaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.secondaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 2),
                              child: TextFormField(
                                controller: textController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText:
                                      'Search indices, stocks, companies...',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Source Sans Pro',
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Source Sans Pro',
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
                  child: Text(
                    'sort by :',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                FlutterFlowDropDown(
                  initialOption: 'Name',
                  options: ['Name', 'Type', 'CurrentPrice'],
                  onChanged: (value) {
                    setState(() => dropDownValue = value);
                  },
                  width: 130,
                  height: 35,
                  textStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.black,
                  ),
                  fillColor: Colors.white,
                  elevation: 2,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  borderRadius: 0,
                  margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                )
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<TickersRecord>>(
              stream: queryTickersRecord(
                queryBuilder: (tickersRecord) => tickersRecord
                    .where('index', isEqualTo: widget.indexParam)
                    .orderBy('ticker'),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.primaryColor,
                      ),
                    ),
                  );
                }
                List<TickersRecord> listViewTickersRecordList = snapshot.data;
                // Customize what your widget looks like with no query results.
                if (snapshot.data.isEmpty) {
                  return Container(
                    height: 100,
                    child: Center(
                      child: Text('No results.'),
                    ),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewTickersRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewTickersRecord =
                        listViewTickersRecordList[listViewIndex];
                    return Container(
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    IndividualStockPageWidget(),
                              ),
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listViewTickersRecord.ticker,
                                              style: FlutterFlowTheme.title2
                                                  .override(
                                                fontFamily: 'Lato',
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 3, 0, 6),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 6, 0),
                                                    child: Text(
                                                      'previousClose',
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: AutoSizeText(
                                                      'currentPrice',
                                                      style: FlutterFlowTheme
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        color: FlutterFlowTheme
                                                            .primaryColor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Text(
                                              'stock type',
                                              style: FlutterFlowTheme.bodyText2
                                                  .override(
                                                fontFamily: 'Source Sans Pro',
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: FlutterFlowTheme.tertiaryColor,
                                    size: 24,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
