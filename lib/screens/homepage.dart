import 'package:Baar/utils/custom_color.dart';
import 'package:flutter/material.dart';
import '../utils/common_widget.dart';
import '../utils/image.dart';
import '../utils/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Tab> _tabs = [
  const Tab(text: Strings.historicalSpaceReport),
  const Tab(text: Strings.draft),
  const Tab(text: Strings.submittedSpaceReport),
];

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final TextEditingController _userNameController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(2);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomInset: false,
            drawer: CommonUtils().commonDrawerWidget(context),
            appBar: PreferredSize(preferredSize: const Size.fromHeight(80), child: CommonUtils().customAppBar(width, context, true, _scaffoldKey)),
            body: _selectedIndex==0? Container(
                height: height,
                width: width,
                padding: const EdgeInsets.all(30),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonUtils().customButton(Size(width / 3.5, 40), Strings.newReport, () {
                          Navigator.pushNamed(context, '/selection');
                        }, 14),
                        Container(
                            width: width / 2.5,
                            height: 42,
                            child: TextFormField(
                                controller: _userNameController,
                                decoration: InputDecoration(
                                  hintText: Strings.search,
                                  hintStyle: const TextStyle(fontSize: 18, color: CustomColor.grey),
                                  contentPadding: const EdgeInsets.only(top: 20), // add padding to adjust text
                                  isDense: true,
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ), // icon is 48px widget.
                                  ),
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      color: CustomColor.darkBlue,
                                      width: 4.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      color: CustomColor.darkBlue,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                style: const TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black))),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 80, bottom: 10),
                      child: DefaultTabController(
                        length: 3,
                        child: Scaffold(
                          appBar: AppBar(
                            toolbarHeight: 3,
                            bottom: TabBar(
                              labelPadding: EdgeInsets.only(left: 25, right: 25),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey,
                              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                              unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
                              overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors.pinkAccent;
                                }
                                return Colors.transparent;
                              }),
                              isScrollable: true,
                              physics: BouncingScrollPhysics(),
                              onTap: (int index) {
                                print('Tab $index is tapped');
                              },
                              tabs: _tabs,
                            ),
                            backgroundColor: CustomColor.themeColor,
                          ),
                          body: TabBarView(
                            physics: BouncingScrollPhysics(),
                            // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
                            // controller: _tabController,
                            children: [
                              Container(
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                                  child: ListView.builder(
                                      itemCount: 6,
                                      itemBuilder: (BuildContext context, int index) {
                                        return getRow(index, MediaQuery.of(context).size.width);
                                      })),
                              Container(
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                                  child: ListView.builder(
                                      itemCount: 2,
                                      itemBuilder: (BuildContext context, int index) {
                                        return getRow(index, MediaQuery.of(context).size.width);
                                      })),
                              Container(
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                                  child: ListView.builder(
                                      itemCount: 4,
                                      itemBuilder: (BuildContext context, int index) {
                                        return getRow(index, MediaQuery.of(context).size.width);
                                      })),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )):_selectedIndex==1?Text(Strings.document, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)):Text(Strings.setting, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            bottomNavigationBar: CommonUtils().customBottomnaviagtion(_selectedIndex,(index){
                setState(() {
                  _selectedIndex = index;
                });
            })));
  }

  Widget getRow(int i, double width) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: SizedBox(
            width: width / 1.3,
            child: const Text(Strings.selectStructuralSelection + Strings.selectStructuralSelection,
                style: TextStyle(decoration: TextDecoration.underline, fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black))),
      ),
      onTap: () {
        setState(() {
          print('row $i');
        });
      },
    );
  }
}
