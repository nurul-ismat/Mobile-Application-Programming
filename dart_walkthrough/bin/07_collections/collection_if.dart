void main() {
  var online = true;
  var signedin = false;

  var components = [
    'Menu',
    'Navigation Bar',
    if (signedin) 'Show Avatar' else 'Show Random Image',
    if (online) 'Show network'
  ];

  print (components);
}

