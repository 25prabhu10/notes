---
title: WebSocket
description: WebSocket is a computer communications protocol, providing bidirectional full-duplex communication channels over a single TCP connection
---

# WebSocket

It is _[Application Layer protocol](./Networking.md#application-layer)_ that provides **bidirectional, full-duplex communication** channels over a **single TCP connection**

- The protocol was standardized by the IETF as **[RFC 6455](https://tools.ietf.org/html/rfc6455)** in 2011, and the WebSocket API in Web IDL is being standardized by the W3C

- It is designed to be implemented in web browsers and web servers, but it can be used by any client or server application

- The WebSocket protocol makes more interaction between a web browser and a web server possible, facilitating **real-time data transfer** from and to the server

- WebSocket is a **stateful protocol** that allows for **bidirectional communication** between the client and server

- Event driven, **message-oriented** protocol

WebSocket vs [HTTP](./HTTP.md):

| WebSocket                    | HTTP                          |
| ---------------------------- | ----------------------------- |
| Full-duplex communication    | Half-duplex communication     |
| Real-time data transfer      | Not real-time data transfer   |
| Stateful protocol            | Stateless protocol            |
| Bi-directional communication | Uni-directional communication |
| Uses a single TCP connection | Uses multiple TCP connections |

- WebSocket is a different TCP protocol from HTTP, but it uses the same port (`80`) and is designed to be understood by HTTP servers and clients
- Uses the same TCP connection over `ws://` or `wss://` (secure) URLs
- Only sends header once, then sends data back and forth

_Example:_ Initial request header (sent only once)

- Request:

```http
...
Connection: upgrade
Upgrade: websockets
...
```

- Response:

```http
Request URL: wss://...
Request Method: GET
Status Code: 101 Switching Protocols
...
```

## Intended Use Case

- **WebSockets not == replacement of HTTP**
- WS is an upgrade for HTTP
- HTTP provides automatic caching
- WS often needs special configuration for load balancing
- Can't communicate with REST
- **Use when you need full-duplex connection**
- Useful for web-based games, chatting applications, anything which needs low-latency realtime connection

## WebSocket Clients

- Used to interface with WebSockets Servers: Built in many languages
- Clients exist for _MicroPy_ and Arduino (IoT)
- Most common client is web based and uses JavaScript
- Require the Server to be able to interface WS

See SocketIO Docs and WebSocket JavaScript Library

## SocketIO

- JavaScript library for manipulating WebSockets: Includes fallback mechanisms and auto-reconnection
- Handles disconnection and connection event
- Namespacing and Room broadcasting

### WebSockets Clientside Code

Native WebSockets support using JavaScript:

```javascript
const socket = new WebSocket('ws://localhost:8080');

socket.onopen = (event) => {
  // on connection, do something...
  socket.send('PyCon AU!!');
};

socket.onmessage = (event) => {
  // message from server
  console.log(event.data);
};
```

Using SocketIO:

```javascript
var socket = io('http://localthost:8000/<MY_NAMESPACE>');

socket.on('connect', () => {
  socket.emit('event_on_my_server', (data = 'PyConAU!!'));
});

socket.on('my_custom_event', (data) => {
  // do something
});
```

### WebSocket Server-Side Code

Using Native Flask WebSockets implementation: `flask_sockets` library:

```python
# do all the imports, setup application above ^
socket = Sockets(app)

@socket.route('/my_sockets')
def my_socket_event(ws):
    while not ws.closed:
        message = ws.receive()
        ws.send(message)
```

Using SocketIO Server: `python_socketio` library:

```python
# do all the imports, setup application above ^
socket = socketio.Server()

@socket.on('my custom event', namespace = '/pycon')
def custome_event(sesstion_id, data):
    # do stuff with data from client, side to all connected to "pycon"
    socket.emit('my event on the server', data, broadcast=True)

app = socketio.Middleware(socket, app)
```

### Python Servers w/WebSocket

- SocketIO with python-socketio: Flask, Tornado, Pyramid, Bottle, Sanic, AioHTTP
- Native WebSockets:
  - Out of the box: Sanic, AioHTTP, Tornado
  - With library: Flask, Django (Channels 2.0), Bottle

## Performance Comparison

- HTTP and WebSockets have the same sized header
- **2 bytes/msg overhead**
- SocketIO increases latency and initial connection:
  - Under the hood starts: uses AJAX Long Polling initially and then upgrades

## Deployment

- `Eventlet` and `Gevent` to monkey patch `async`: or just use standard threading...
- Async web frameworks are ideal
- Use message queue to run multiple instances behind load balancers with sticky sessions on workers

## Alternate Methods

Alternate ways to replicate real time communication functionality

### Polling and Long Polling

HTTP hack for real-time communication: **Long Polling** (keep connection open until new data is sent back) or **Polling** (send [AJAX](../../Languages/JavaScript/JavaScript.md#ajax-asynchronous-javascript-and-xml) request every X amount of seconds for new data) are alternatives to WebSockets

- **Polling**: Send AJAX request every X amount of seconds for new data (not true real time)
- **Long Polling**: Send request to server and keep connection open until new data is sent back and keep repeating this process
- Much better backwards compatibility

Issues:

- These methods are not truly real-time and have higher latency
- Requests are sent regardless of whether there is new data or not

### Server Sent Events

Ways to replicate real time communication functionality

- Another "real-time" alternative: Uses _EventSource_ API to send messages from server. Not truly bi-directional
- Generally requires an event loop
- No binary message capabilities

> See EventSource API, Python/Django Implementations of SSE
