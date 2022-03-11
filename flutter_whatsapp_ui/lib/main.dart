import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Whatsapp Clone',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: Home(),
      ),
    );

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildTabBarView(),
        floatingActionButton: _buildFloatingActionButton(),
        drawer: _buildDrawer(),
        endDrawer: _buildEndDrawer(),
      ),
    );
  }
} // class Home

Drawer _buildDrawer() {
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Container(color: Colors.teal),
        ),
        ListTile(
          leading: Icon(Icons.group),
          title: Text('New Group'),
          trailing: Icon(Icons.expand_more),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.contacts),
          title: Text('Contacts'),
          trailing: Icon(Icons.more_horiz),
        ),
        ListTile(
          leading: Icon(Icons.call),
          title: Text('Calls'),
          trailing: Icon(Icons.more_horiz),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          trailing: Icon(Icons.expand_more),
        ),
      ],
    ),
  );
}

Drawer _buildEndDrawer() {
  const menu = const <String>[
    'New group',
    'New broadcast',
    'Whatsapp Web',
    'Starred messages',
    'Settings'
  ];

  return Drawer(
    child: ListView.builder(
      itemExtent: 50,
      itemCount: menu.length,
      itemBuilder: (context, index) =>
          Card(child: ListTile(title: Text(menu[index]))),
    ),
  );
}

void _doNothing() {}

AppBar _buildAppBar() {
  return AppBar(
    // leading: IconButton(
    //   icon: Icon(Icons.menu),
    //   onPressed: _doNothing,
    // ),
    title: Text('Whatsapp'),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.search), onPressed: _doNothing),
      IconButton(icon: Icon(Icons.message), onPressed: _doNothing),
      _AppBarActionMoreButton(),
    ],
    bottom: TabBar(tabs: [
      Tab(text: 'CALLS', icon: Icon(Icons.call)),
      Tab(text: 'CHATS', icon: Icon(Icons.chat)),
      Tab(text: 'CONTACTS', icon: Icon(Icons.contacts)),
    ]),
  );
}

class _AppBarActionMoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () => Scaffold.of(context).openEndDrawer());
  }
}

TabBarView _buildTabBarView() {
  final chats = List<String>.generate(10, (i) => 'Chat message #${i + 1}');

  return TabBarView(children: [
    Container(color: Colors.pink, child: Center(child: Text('Calls Tab'))),
    _ChatsTabView(chats),
    Container(color: Colors.amber, child: Center(child: Text('Contact Tab'))),
  ]);
}

class _ChatsTabView extends StatelessWidget {
  final List items;

  _ChatsTabView(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.chat),
        title: Text(items[index]),
        subtitle: Text('Subtitle ${index + 1}'),
        trailing: Icon(Icons.more_horiz),
        onLongPress: () => Scaffold.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 5),
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
          content: Text('Item ${items[index]} has been long pressed'),
        )),
      ),
    );
  }
}

FloatingActionButton _buildFloatingActionButton() {
  return FloatingActionButton(
    onPressed: _doNothing,
    child: Icon(Icons.add),
  );
}
