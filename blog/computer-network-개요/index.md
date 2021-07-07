# Computer Networking - 개요

Computer Networking - 개요
<!--more-->
# Computer-Network-개요

# 1. Data communication vs Computer network

---

전자는 두개의 디바이스, 후자는 많은 디바이스 간의 네트워크 형성

두 개는 필수불가결하게 연결되어 있다.

# 2. What's the internet

---

## 1. Internet

Network of Networks

ISP들에 의해 연결됨

## 2. Protocols

메세지를 보내고 받는 것을 제어

## 3. Internet 표준

RFC, IETF 등이 있음

# 3. Network Edge

---

## Hosts

클라이언트와 서버

네트워크 엣지라고도 불림

서버들은 보통 데이터센터에 입주해 있음 

## Access Networks, Physical Media

네트워크 엣지들이 네트워크 코어에 접근하기 위해 사용하는 네트워크

무선 네트워크 (WIFI), 유선 네트워크 (LAN) 등

## Network Core

라우터들로 구성되어 있음

Network of Networks

# 4. InterNetwork

---

End Points (Hosts) 들이 작은 네트워크들을 이루고 이 네트워크들이 큰 네트워크를 이루며 또 이러한 네트워크들이 더 큰 네트워크를 이룬다.

이 것이 인터넷의 기본적인 구조이다.

# 5. ISP

---

한 ISP 내부에서는 서로 통신할 수 있지만, 해당 ISP가 다른 ISP에 연결되어 있지 않다면 각각의 ISP의 사용자들은 서로 통신할 수 없다.

## Tier-1 ISP

나라 전체를 커버할 수 있는 대형 ISP

## Tier-2 ISP

하나 또는 그 이상의 **Tier-1 ISP**와 연결되어 있으며, 다른 **Tier-2 ISP**와도 연결될 수 있다

Tier-2 ISP는 Tier-1 ISP 돈을 지불하고 인터넷 연결성을 보장받는다. (즉 서비스를 이용한다)

## Tier-3 ISP and Local ISP

Last Hop, 즉 사용자와 가장 가까운 ISP

더 높은 ISP에게 돈을 지불하고 인터넷 연결성을 보장받는다.

# 6. Internet Protocol Stack

---

인터넷 프로토콜 스택은 계층화된 (layered) 구조로 이루어져 있는 프로토콜들의 집합이다.

굳이 계층을 나누어 놓은 이유는 네트워크는 복잡한 시스템들의 조각들로 이루어져 있기 때문에 이 구조를 **모듈화**하여 좀 더 식별하고, 관계화 할 수 있도록 해주기 위해서이다.

모듈화를 한다면, 하나의 모듈이 업데이트가 필요할 때 해당 모듈 부분만 업데이트를 하면 되기에 불필요하게 전체 시스템을 건드리지 않아도 된다.

**Application, transport, network, link, physical**의 다섯가지로 나뉘어 있으며

- **Application** 계층은 말 그대로 응용 프로그램들이 사용하는 서비스들을 정의하는 계층
- **Transport** 계층은 프로세스에서 프로세스 사이의 데이터 전송을 정의하는 계층
- **Network** 계층은 Source에서 Destination 까지의 데이터그램을 라우팅하는 것을 정의하는 계층
- **Link** 계층은 인접한 노드들끼리의 데이터 전송을 정의하는 계층
- **Physical** 계층은 Bit 신호를 물리 Wire를 통해 전송하는 것을 정의한다

# 7. Encapsulation

**Source**에서 **Destination**까지 메세지를 보낼 때 Application 계층에서 Physical 계층까지 내려가며 **Header**를 붙이게 되고, 이 **Header**들은 전송되는 과정에서 다시 벗겨지며 **Destination**의 **Application**에 도달하게 된다.
