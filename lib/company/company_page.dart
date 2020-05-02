import 'package:flutter/material.dart';
import 'package:flutter_web/constants/page_titles.dart';
import 'package:flutter_web/widgets/app_scaffold.dart';

class CompanyPage extends StatelessWidget {

  final List<String> listData = <String>['Events', 'Shops', 'Deals', 'FeedBacks', 'Request', 'Logout'];
  final List<String> company = <String>['Events Pvt Ltd', 'Shops Pvt Ltd', 'Deals Pvt Ltd', 'FeedBacks Pvt Ltd', 'Request Pvt Ltd', 'Logout Pvt Ltd'];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.company,
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Search for companies',
                  ),
                  readOnly: true,
                  onTap: null,
                ),
              ),
              RaisedButton(
                color: Colors.white,
                onPressed: null,
                child: Text(
                  'Add New Company',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => Divider(),
            itemCount: listData.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.apps),
                  title: Text('${company[index]}',
                    style: TextStyle(fontSize: 22.0),),
                  contentPadding: EdgeInsets.all(10.0),
                  trailing: SizedBox(
                    width: MediaQuery.of(context).size.width/4,
                    child:  Wrap(
                      spacing: 12,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.white,
                          onPressed: null,
                          child: Text(
                            'View',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        RaisedButton(
                          color: Colors.white,
                          onPressed: null,
                          child: Text(
                            'Edit',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        RaisedButton(
                          color: Colors.white,
                          onPressed: null,
                          child: Text(
                            'Delete',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      Text('Company Id : ${listData[index]}'),
                      Text('Address : ${listData[index]}'),
                      Wrap(
                        spacing: 20,
                        children: <Widget>[
                          Text('Ph No. : ${listData[index]}'),
                          Text('Email : ${listData[index]}'),
                        ],
                      ),
                      Text('Website : ${listData[index]}'),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

}