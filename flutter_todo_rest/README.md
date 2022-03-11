# flutter_todo_rest

A Flutter app to test consuming a RESTful API server

## Setting Up JSON Server Locally

- [Install Node JS](https://nodejs.org/en/download)
- [Install JSON Server](https://github.com/typicode/json-server)
- Run the server (from terminal)

  `json-server --host your-pc-IP-address db.json`

## Other servers

- [JSON online server for this API](https://my-json-server.typicode.com/jumail-utm/flutter_todo_rest)
- REST API Server on Heroku using Node JS. _To be updated_
- REST API Server on Firebase. _To be updated_

## Choosing the server to test on

Open the project and specify the variable `baseUrl` (in the file `lib/services/data_service.dart`) to the server that you want to test on
