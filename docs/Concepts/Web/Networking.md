---
title: Networking
description: Concepts and technologies related to networking
---

# Networking

Networking is the practice of connecting computers and other devices together to share resources. Networks can be connected by cables, radio waves, or infrared light beams

A **network** refers to two or more connected computers that can share resources such as data, a printer, an Internet connection, applications, or a combination of these resources

- The Internet is the largest network in the world

Types of networks:

- Local Area Network (LAN): A network that is confined to a relatively small area, such as a single building or a campus
- Metropolitan Area Network (MAN): A network that covers a city or a large campus
- [Wide Area Network (WAN)](#wan): A network that covers a broad area, such as a city, country, or the world

  - Leased Line: A dedicated connection between two points
  - Circuit Switching: Establishes a dedicated communication path between two points for the duration of the communication

    - A method of implementing a telecommunications network in which two network nodes establish a dedicated communications channel (circuit) through the network before the nodes may communicate
    - Like a telephone call, where a connection is established between two parties for the duration of the call
    - Asynchronous serial. ISDN Layer 1

  - Frame Relay: A packet-switching technology that uses a virtual circuit identifier to identify the connection between two points

    - A packet-switching protocol that operates at the data link layer (layer 2) of the OSI model
    - It is used to connect LANs over a wide area network (WAN)
    - Frame relay is a cost-effective way to connect LANs over a WAN
    - Synchronous serial

  - Broadband: A high-speed Internet connection that is always on

    - A type of high-speed Internet connection that is always on and provides faster data transmission rates than traditional dial-up connections
    - Broadband connections are typically faster and more reliable than dial-up connections
    - Cable, DSL, Fiber, Satellite, Wireless WAN

### WAN

- Physical layer implementations vary
- Cable specifications define speed of link

```text
+----------------------------------------------------------------------------------------------------+
| Cisco HDLC | PPP | Frame Relay | ISDN BRI (with PPP)                | DSL Modem      | Cable Modem |
|--------------------------------|------------------------------------|----------------|-------------|
|                                | RJ-48                              | RJ-11          | BNC         |
| ΕΙΑ/ΤΙΑ-232                    | Note: ISDN BRI cable pinouts       | Note: Works    | Note: Works |
| ΕΙΑ/ΤΙΑ-449                    | are different than the pinouts     | over telephone | over cable  |
| X.21 V.24 V.35                 | for Ethernet. The RJ-48 and RJ-45  | line           | TV line     |
| HSSI                           | look the same, but the pinouts are |                |             |
|                                | different.                         |                |             |
+----------------------------------------------------------------------------------------------------+
```

## Network Topologies

A network topology is the arrangement of a network, including its nodes and connecting lines. There are several different types of network topologies, including:

1. **Bus Topology**: All devices are connected to a single cable, called **the bus or backbone**. When one device sends data, all other devices receive it

   - Pros: Simple and inexpensive to set up and maintain
   - Cons: Single point of failure, limited scalability, and performance issues as the network grows

   ```text
                +----+    +----+    +----+
                | PC |    | PC |    | PC |
                +----+    +----+    +----+
                  |         |         |
   terminator ----+---------+---------+---- terminator
                         segment
                            |
                            |
                          +----+
                          | PC |
                          +----+
   ```

2. **Ring Topology**: All devices are connected in a circular fashion. Each device is connected to two other devices, forming a ring. Data travels around the ring until it reaches its destination

   - Pros: Fast and efficient data transfer, no collisions. More reliable than bus topology (if one link fails, the rest of the network is unaffected)
   - Cons: Difficult to troubleshoot and expand, limited scalability

   ```text
   +----+    +----+
   | PC |----| PC |
   +----+    +----+
      |         |
   +----+    +----+
   | PC |----| PC |
   +----+    +----+
   ```

3. **Star Topology**: All devices are connected to a central [hub](#hub) or [switch](#switch). When one device sends data, it goes through the hub or switch to reach its destination

   - Pros: Easy to install, troubleshoot, and expand. No collisions, high performance
   - Cons: Single point of failure (hub or switch), expensive

   ```text
   +----+  +----+  +----+
   | PC |  | PC |  | PC |
   +----+  +----+  +----+
      \      |      /
       \     |     /
        \    |    /
         \   |   /
          \  |  /
           \ | /
          +-----+
          | Hub |
          +-----+
   ```

   - Extended Star Topology: Multiple star topologies connected to a central hub or switch

     ```text
     +----+  +----+  +----+
     | PC |  | PC |  | PC |
     +----+  +----+  +----+
        |      |      |
     +-----+ +-----+ +-----+
     | Hub | | Hub | | Hub |
     +-----+ +-----+ +-----+
        \      |      /
         \     |     /
          \    |    /
           \   |   /
            \  |  /
             \ | /
            +-----+
            | Hub |
            +-----+
     ```

4. **Mesh Topology**: Every device is connected to every other device in the network

   - Pros: High reliability, fault tolerance, and performance. No single point of failure
   - Cons: Expensive, difficult to install and manage, and limited scalability

   ```text
   +----+  +----+  +----+
   | PC |--| PC |--| PC |
   +----+  +----+  +----+
      |      |      |
   +----+  +----+  +----+
   | PC |--| PC |--| PC |
   +----+  +----+  +----+
      |      |      |
   +----+  +----+  +----+
   | PC |--| PC |--| PC |
   +----+  +----+  +----+
   ```

5. **Hybrid Topology**: A combination of two or more different network topologies

   - Pros: Balances the advantages and disadvantages of different topologies
   - Cons: Complex, expensive, and difficult to manage

## OSI Model

The OSI (Open Systems Interconnection) model is a conceptual framework used to understand how different networking protocols work together. It consists of seven layers, each with its own set of functions and responsibilities:

1. **[Physical Layer](#physical-layer)**: The physical layer is responsible for transmitting raw data bits over a physical medium. It deals with the physical connection between devices and the transmission of data

2. **[Data Link Layer](#data-link-layer)**: The data link layer is responsible for transmitting data frames over a physical medium. It deals with error detection and correction, flow control, and framing

3. **[Network Layer](#network-layer)**: The network layer is responsible for routing data packets from the source to the destination. It deals with logical addressing, routing, and congestion control

4. **[Transport Layer](#transport-layer)**: The transport layer is responsible for end-to-end communication between devices. It deals with error detection and correction, flow control, and data segmentation

5. **[Session Layer](#session-layer)**: The session layer is responsible for establishing, maintaining, and terminating connections between devices. It deals with session management and synchronization

6. **[Presentation Layer](#presentation-layer)**: The presentation layer is responsible for translating data into a format that can be understood by the application. It deals with data encryption, compression, and formatting

7. **[Application Layer](#application-layer)**: The application layer is responsible for providing network services to applications. It deals with user interfaces, file transfers, and network management

```text
+---------------------+
| Application         |
+---------------------+
| Presentation        |
+---------------------+
| Session             |
+---------------------+
| Transport           |
+---------------------+
| Network             |
+---------------------+
| Data Link           |
+---------------------+
| Physical            |
+---------------------+
```

The OSI model provides a common language for networking professionals to discuss how different networking protocols interact with each other. It helps to understand the functions and responsibilities of each layer in the networking stack

- Reduce complexity
- Standardizes interfaces
- Facilitates modular engineering
- Ensures interoperable technology
- Accelerates evolution
- Simplifies teaching and learning

> OSI Internet Model or the Internet Protocol Suite Networking

### Application Layer

The application layer is the top layer of the OSI model. It is responsible for providing network services to applications. It deals with user interfaces, file transfers, and network management

- Network Processes to Applications
- Data Representation
- InterHost Communication

### Transport Layer

The transport layer is responsible for end-to-end communication between devices. It deals with error detection and correction, flow control, and data segmentation

End-to-End Connections:

- Handles transportation issues between hosts
- Ensures data transport reliability
- Establishes, maintains and terminates virtual circuits
- Provides reliability through fault detection and recovery
- Information flow control

#### Transport Layer Implementations

The Transport layer is charge of the reliable/unreliable transport of data. It can be implemented as TCP or UDP

- **TCP (Transmission Control Protocol)**: A connection-oriented protocol that provides reliable, ordered, and error-checked delivery of data. It is used for applications that require high reliability, such as web browsing, email, and file transfer

  - Connection-oriented
  - Reliable
  - Error-checked
  - Ordered delivery
  - Flow control
  - Congestion control

- **UDP (User Datagram Protocol)**: A connectionless protocol that provides fast, unreliable, and unordered delivery of data. It is used for applications that require low latency, such as online gaming, video streaming, and voice over IP (VoIP)

  - Connectionless
  - Unreliable
  - Unordered delivery
  - Low latency
  - No flow control
  - No congestion control

TCP vs UDP:

Each frame goes through several buffers as you send it: The application buffer, The Protocol Buffer, The Software interface buffer and the Hardware interface buffer. As you start stressing the stack by sending high speed data you will fill up these buffers and either block or lose data. You also have strategies for timeliness and polling that can impact your performance. For example, by using a larger buffer and poll less often you can get much better performance while sacrificing latency

TCP is optimized for high speed bulk transfers while UDP is optimized for low latency in the Linux kernel. This has an impact on buffer sizes and how data is polled and handed over. In addition to this, you frequently have offloading to hardware for TCP. I would expect considerably better performance for TCP compared to UDP

Note that sending high speed data over UDP is usually a bad idea, unless you implement your own congestion control. TCP protects your network from congestion collapses. Use UDP when you have small amounts of data or high timeliness requirements

### Network Layer

The network layer is responsible for routing data packets from the source to the destination. It deals with logical addressing, routing, and congestion control

- The network layer provides connectivity and path selection between two host systems that may be located on geographically separated networks

Data Delivery:

- Provides connectivity and path selection between two host systems
- Routes data packets
- Selects best path to deliver data
- The Network layer prioritizes data known as Quality of Service (QoS)

Standard Protocols:

- IP (Internet Protocol): IP is a standard that defines the manner in which the network layers of two hosts interact. IP addresses are 32 bit long, hierarchical addressing scheme

  - IPv4: 32-bit address, 4.3 billion addresses
  - IPv6: 128-bit address, 340 undecillion addresses
  - IP addresses are divided into classes: A, B, C, D, E
  - IP addresses are divided into two parts: Network ID and Host ID
  - IP Address = Logical Address

  _Example:_ IP Address: `192.168.6.17`

- ICMP (Internet Control Message Protocol)

Devices:

- [Routers](#router)
- Layer 3 [Switch](#switch): A Layer 3 switch is a device that combines the functionality of a switch and a router. It can switch data packets at the data link layer (Layer 2) and route data packets at the network layer (Layer 3)

### Data Link Layer

The data link layer is responsible for transmitting data frames over a physical medium. It deals with error detection and correction, flow control, and framing

- Data Link layer protocols create, transmit, and receive packets. This layer is also responsible for logical MAC addressing and LLC processing, creating logical topologies, and controlling media access

Access to Media:

- Defines how data is formatted for transmission and how access to the network is controlled

#### MAC Address

A MAC address is a unique identifier assigned to network interfaces for communications on the physical network segment. MAC addresses are used as a network address for most IEEE 802 network technologies, including Ethernet and Wi-Fi

- The network interface card address, called the hardware address, is protocol-independent and is usually assigned at the factory. This address is technically called the media access control address (MAC) because it is found on the MAC sub layer of the Data Link layer

- MAC Address = Hardware Address = Physical Address
- MAC addresses are 48 bits long (6 bytes)

_Example:_ Mac Address: `00-1A-2B-3C-4D-5E`

#### Data Link Devices

Data link devices operate at the data link layer (Layer 2) of the OSI model. They are responsible for transmitting data frames over a physical medium. There are several different types of data link devices, including:

- [Switch](#switch)
- [Bridge](#bridge)

The Data Link layer is manipulated by two devices: bridges and switches. These are more complex and more expensive than their Physical layer counterparts, but they do have advantages

### Physical Layer

The physical layer is responsible for transmitting raw data bits over a physical medium. It deals with the physical connection between devices and the transmission of data

Binary Transmission:

- Defines the electrical, mechanical, procedural, and functional specifications for activating, maintaining, and deactivating the physical link

## Physical Media

Physical media refers to the physical materials used to transmit data between devices. There are several different types of physical media, including:

1. **Copper**: Copper cables are the most common type of physical media used in networking. They are inexpensive, easy to install, and can carry data over long distances. Copper cables are used in Ethernet networks, telephone systems, and other applications

   - **Twisted Pair**: Twisted pair cables are made of pairs of insulated wires that are twisted together. They are used in Ethernet networks, telephone systems, and other applications

     ```text
     RJ-45 Connector --- Outer jacket ---> Twisted pairs
     ```

   - **Coaxial**: Coaxial cables are made of a central conductor surrounded by an insulating layer, a conductive shield, and an outer insulating layer. They are used in cable television, Internet connections, and other applications

     ```text
     BNCC Connector --- Outer jacket ---> Braided Copper Shield ---> Insulating Layer ---> Copper Conductor
     ```

2. **Fiber Optic**: Fiber optic cables are made of glass or plastic fibers that transmit data using light. They are faster and more reliable than copper cables, but they are also more expensive and difficult to install. Fiber optic cables are used in high-speed networks, long-distance connections, and other applications

   - **Single-mode**: Single-mode fiber optic cables use a single beam of light to transmit data. They are used in long-distance connections and high-speed networks
   - **Multi-mode**: Multi-mode fiber optic cables use multiple beams of light to transmit data. They are used in short-distance connections and lower-speed networks

     ```text
     Fiber Optic Cable --- Outer jacket ---> Kevlar Reinforcement Material ---> Plastic Shield ---> Glass and Fiber Cladding
     ```

3. **Wireless**: Wireless media uses radio waves or infrared light beams to transmit data between devices. Wireless networks are convenient, flexible, and easy to install, but they are also less secure and reliable than wired networks. Wireless media is used in Wi-Fi networks, Bluetooth devices, and other applications

Comparison of Physical Media:

|           | Twisted Pair    | Coaxial     | Fiber Optic             | Wireless LAN  |
| --------- | --------------- | ----------- | ----------------------- | ------------- |
| Bandwidth | Up to 1 Gbps    | 10-100 Mbps | Up to 10 Gbps or higher | Up to 54 Mbps |
| Distance  | Up to 100m      | Up to 500m  | Up to 60 km             | Up to 100m    |
| Price     | Least expensive | Inexpensive | Most expensive          | Moderate      |

### Twisted Pair Cables Cheat-Sheet

Twisted pair cables are used in many applications. They are often used in computer networking, where they are used to connect computers and other devices to the Internet. Twisted pair cables are also used in telephone systems, where they are used to connect telephones to the telephone network. Twisted pair cables are made up of pairs of insulated wires that are twisted together. The twisting of the wires helps to reduce electromagnetic interference and crosstalk. There are several different types of twisted pair cables, including unshielded twisted pair (UTP), shielded twisted pair (STP), foil twisted pair (FTP), and shielded foil twisted pair (S/FTP). Each type of twisted pair cable has its own advantages and disadvantages, and is used in different applications

### Cable Types

There are several different types of twisted pair cables, including unshielded twisted pair (UTP), shielded twisted pair (STP), foil twisted pair (FTP), and shielded foil twisted pair (S/FTP). Each type of twisted pair cable has its own advantages and disadvantages, and is used in different applications

#### Unshielded Twisted Pair (UTP)

As the title states, a UTP cable has no shielding. This is the most used and most basic type of cable. The cable contains pairs of wires twisted together to help reduce and prevent electromagnetic interference.

#### Shielded Twisted Pair (STP)

STP cables are similar to UTP cables, where the wires are twisted together and then wrapped with a shielding or screening material which consits of foil wrapping or a copper braid jacket.

#### Foil Twisted Pair (FTP)

With FTP cables, each twisted pair of cables is wrapped in a shielding of foil to protect the cable from EMI and crosstalk.

#### Shielded Foil Twisted Pair (S/FTP)

A cable that is classified as S/FTP or Shielded Foil Twisted Pair is a combination of both FTP and STP shielding. The wires inside the cable are twisted and then shielded with a foil wrapping, then the 4-pair grouping of foiled wires are shielded by a wrapping of either foil or a flexible braided screening. This provides the highest level of protection against EMI and crosstalk.

### Wiring

- TIA/EIA 568A Wiring:

| Pin | Color-Text       |
| --- | ---------------- |
| 1   | White and Green  |
| 2   | Green            |
| 3   | White and Orange |
| 4   | Blue             |
| 5   | White and Blue   |
| 6   | Orange           |
| 7   | White and Brown  |
| 8   | Brown            |

- TIA/EIA 568B Wiring:

| Pin | Color-Text       |
| --- | ---------------- |
| 1   | White and Orange |
| 2   | Orange           |
| 3   | White and Green  |
| 4   | Blue             |
| 5   | White and Blue   |
| 6   | Green            |
| 7   | White and Brown  |
| 8   | Brown            |

- Categories:

| Category   | MHz     | Speed                 |
| ---------- | ------- | --------------------- |
| CAT 3 UTP  | 16MHz   | 10Mps up to 100m      |
| CAT 4 UTP  | 20MHz   | 16Mps up to 100m      |
| CAT 5 UTP  | 100MHz  | 100Mbps up to 100m    |
| CAT 5e UTP | 100MHz  | 1000Mbps up to 100m   |
| CAT 5e STP | 100MHz  | 1000Mbps up to 100m   |
| CAT 6 UTP  | 250MHz  | 10Gbps over to 33-55m |
| CAT 6a STP | 500MHz  | 10Gbps over 100m      |
| CAT 7 STP  | 600MHz  | 10Gbps over 100m      |
| CAT 7a STP | 1000MHz | 10Gbps over 100m      |
| CAT 8 STP  | 2000MHz | 25/40Gps up to 30m    |

## Network Devices

Network devices are hardware or software components that are used to connect computers and other devices to a network. There are several different types of network devices, including:

### Hub

A hub (repeater) is a simple networking device that connects multiple devices in a network. It receives data packets from one device and broadcasts them to all other devices in the network

- A hub (concentrator) is a device that repeats the signals it receives on one port to all other ports. It is a central connection point for several network devices

Hub (Multiport Repeater): A hub is a multiport repeater that forwards packets to all ports except the one on which the packet was received. Hubs operate at the physical layer (Layer 1) of the OSI model

### Bridge

A bridge is a network device that connects two or more network segments. It operates at the data link layer (Layer 2) of the OSI model and uses MAC addresses to forward data frames between segments

- A bridge is a device that connects two or more network segments and forwards packets between them based on the MAC address in the packet header
- Bridges operate at the data link layer (Layer 2) of the OSI model

### Switch

A switch is a network device that connects multiple devices in a network. It operates at the data link layer (Layer 2) of the OSI model and uses MAC addresses to forward data frames to the correct destination

- A switch is a multiport bridge that forwards packets to the appropriate port based on the MAC address in the packet header
- Switches operate at the data link layer (Layer 2) of the OSI model

When a switch receives data the switch examines the data link header for the MAC address of the destination station and forwards it to the correct port. This opens a path between ports that can use the full bandwidth of the topology

#### Layer 2 Switch

A Layer 2 switch is a device that operates at the data link layer (Layer 2) of the OSI model. It uses MAC addresses to forward data frames to the correct destination

#### Layer 3 Switch

A Layer 3 switch is a device that combines the functionality of a switch and a router. It can switch data packets at the data link layer (Layer 2) and route data packets at the network layer (Layer 3)

- The Layer 3 switch functions at the Network layer and performs the multiport, virtual LAN, data pipelining functions of a standard Layer 2 switch. It can also perform basic routing functions between virtual LANs

#### Layer 4 Switch

A Layer 4 switch is a device that operates at the transport layer (Layer 4) of the OSI model. It can make routing decisions based on information in the transport layer header

#### Multi-Layer Switch

A multi-layer switch is a device that combines the functionality of a switch and a router. It can switch data packets at the data link layer (Layer 2) and route data packets at the network layer (Layer 3)

- High-speed scalability
- Low latency compared to routers

Combines functionality of:

- Layer 2 switching
- Layer 3 switching
- Layer 4 switching

### Router

A router is a network device that connects multiple networks together. It operates at the network layer (Layer 3) of the OSI model and uses IP addresses to forward data packets to the correct destination

- A router is a device that connects two or more networks. It forwards data packets between networks based on their IP addresses
- Routers facilitate communication within this internet work. It decides how to send packets within the network so that they arrive at their destination

### Gateway

A gateway is a network device that connects two different types of networks together. It operates at the application layer (Layer 7) of the OSI model and translates data between the two networks

A gateway is a combination of hardware and software that connects dissimilar network environments. It performs translations at multiple layers of the open system interconnection (OSI) model

### Firewall

A firewall is a network device that monitors and controls incoming and outgoing network traffic. It operates at the network layer (Layer 3) of the OSI model and filters data packets based on predefined security rules

A firewall is a system or group of systems that manages access between two or more networks

### Network Interface Card (NIC)

A network interface card (NIC) is a hardware component that connects a computer or other device to a network. It provides a physical connection between the device and the network, allowing the device to send and receive data
