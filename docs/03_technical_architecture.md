# Technical Architecture

## 1. Overview
The **Commoniety App** follows a modular, service-oriented architecture divided into:
- **Backend (Node.js + Express + PostgreSQL)**  
- **Mobile Frontend (Flutter + Riverpod)** 

---

## 2. Architecture Layers
### a. Mobile Layer
- Developed in **Flutter** for cross-platform deployment (Android, iOS, Web).
- Manages:
  - Authentication flow
  - State management with **Riverpod**
  - UI/UX rendering
  - API communication via REST endpoints

### b. Backend Layer
- Developed in **Node.js (Express)**.
- Handles:
  - User authentication (JWT)
  - Wallet and fund management logic
  - Payment integrations (Circle / NOWPayments)
  - Webhooks for transaction confirmation
  - Notification dispatch via FCM or email

### c. Database Layer
- Uses **PostgreSQL** for money ledger and accuracy.
- Stores user profiles, wallets, communities, and transactions.

---

## 3. API Design
- RESTful endpoints with clear resource naming:
- - Authentication: JWT tokens stored securely in Flutter’s secure storage.
- Validation: Middleware for input validation and permission checks.

---

## 4. Integrations
| Service | Purpose |
|----------|----------|
| **Flutterwave** | Payment processing and virtual wallet creation |
| **Firebase Cloud Messaging (FCM)** | Push notifications |
| **Cloudinary / S3** | Image and document storage |

---

## 5. Security
- End-to-end encrypted transactions  
- HTTPS across all API calls  
- JWT with refresh token strategy  
- Encrypted PIN and password storage  
- Role-based access for community admins  

---

## 6. Scalability Plan
- Microservices separation for wallet, community, and payments modules.
- WebSocket or CM for real-time notifications.

