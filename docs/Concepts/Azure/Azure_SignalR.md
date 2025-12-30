---
title: Azure SignalR Service
description: Azure SignalR Service is a fully managed real-time messaging service that allows you to add real-time functionality to your application
---

# Azure SignalR

Azure SignalR Service is a fully managed real-time messaging service that allows you to add real-time functionality to your application

- It is built on ASP.NET Core SignalR
- Azure SignalR Service is a fully managed service (serverless)
- It is a great choice for building real-time web applications, such as chat applications, real-time dashboards, and live data visualizations

## Features

- **Real-time messaging**: Send messages to all connected clients in real-time
- **Broadcast**: Send messages to all connected clients
- **Group messaging**: Send messages to specific groups of clients
- **Connection management**: Manage client connections
- **Authentication**: Authenticate clients
- **Authorization**: Authorize clients
- **Serverless**: No need to manage servers

Standard based, Native ASP.NET Core support, Broad client support, Handle large-scale client connections, and Remove the burden to self-host SignalR

## Use Cases

- **Chat applications**: live chat room, chat bot, on-line customer support
- **Real-time dashboards**: company dashboards, financial market data, sales update, and IoT monitoring
- **High-frequency data updates**: games, voting, auctions
- **Real-time location on maps**: logistics tracking, delivery tracking, and ride-sharing apps

## ASP.NET Core SignalR

ASP.NET Core SignalR is an open-source library that simplifies adding real-time web functionality to your applications

- It provides an API for creating server-to-client remote procedure calls (RPCs)
- RPCs invoke functions on clients from the server-side .NET Core code

### Transports

SignalR supports multiple transports (technologies) for communication between the client and the server:

- **WebSockets**: The most efficient transport for real-time web communication
- **Server-Sent Events (SSE)**: A one-way messaging channel from the server to the client
- **Long Polling**: A request-response mechanism where the client sends a request to the server and waits for a response

The order of preference for the transports is WebSockets, Server-Sent Events, and Long Polling

- The order in which the transports are listed here signifies their graceful fallback order

### Server

The server is responsible for exposing a SignalR endpoint and managing client connections

- The endpoints map to a [SignalR hub](#hub)
- Expose hub methods that clients can call, and also events that clients can subscribe to (these are called [RPC](../Web/RPC.md) methods)

#### Hub

A hub is a high-level pipeline that allows clients and servers to call methods on each other

- Communication between clients and servers is done through the hub
- Think of a hub as a proxy between all connected clients and the server

#### Protocol

SignalR Protocol is a protocol for a two-way communication between the client and the server

SignalR provides two built-in hub protocols:

- **JSON**: A text-based protocol that uses JSON to serialize data
- **MessagePack**: A binary protocol that uses _MessagePack_ to serialize data (more efficient than JSON)

#### User

SignalR allows you to associate a user with a connection

- User can act as an individual user or be part of a group
- Messages can be sent to a specific user or a group of users
- A single user can connect from multiple devices

#### Group

A group is a collection of connections that can be managed as a single unit

- Group has a specified name, which acts as its unique identifier

### Client

The client is responsible for establishing a connection with the server and sending and receiving messages

- Use `HubConnection` to establish a connection with the server

## Azure Web PubSub

Azure Web PubSub is a fully managed service that enables you to build real-time web applications with WebSockets and the publish-subscribe pattern

- Build real-time applications using WebSockets and the publish-subscribe pattern
- Publish updates between server and all connected clients (broadcast)
- Messaging between server and a group of clients
- Messaging between clients that belong to a group

Unit measures the capability of the service

- 1 unit = 1000 concurrent connections
- PubSub Service can have 1, 2, 5, 10, 20, 50, or 100 units

Free, Standard, and Premium tiers

- Outbound traffic from service billed for usage beyond the free quota (2 GB/day/unit)
- Plan for Max. 80% unit utilization before scaling up for optimal performance
