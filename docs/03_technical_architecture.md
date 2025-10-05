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

## 4. Payment Integration
- Use of Flutterwave virtual accounts for account creation and transaction execution:
