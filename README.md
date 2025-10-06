# Community Wallet

A modern **mobile wallet and social funding platform** that empowers individuals, alumni groups, and communities to **collect, manage, and transparently track funds** for shared goals — all in one secure, connected space.

---

## Overview

**Community Wallet** combines the simplicity of a digital wallet with the connectivity of a social network.  
Users can create **virtual accounts** for purposes such as:
- Crowdfunding campaigns  
- Alumni dues and reunions  
- Community projects or charity drives  

Contributors can fund these virtual accounts easily while staying updated on progress, transactions, and goals — creating **trust and transparency** within every community.

---

## Core Features (MVP)

- **User Authentication** — Secure sign-up and login (email and password).  
- **Community Creation** — Build or join funding circles and manage members.  
- **Virtual Wallets** — Each user and community has a unique wallet address.  
- **Contributions** — Receive funds from members or external donors.  
- **Transaction History** — Transparent, real-time tracking of inflows and outflows.  
- **Notifications** — Updates for contributions, milestones, and fund goals.  
- **Multi-Platform Access** — Built with Flutter for Android, iOS, and Web.

---

## Documentation Index

| File | Description |
|------|--------------|
| [`01_product_overview.md`](./docs/01_product_overview.md) | Business concept, goals, and vision. |
| [`02_mvp_user_flows.md`](./docs/02_mvp_user_flows.md) | Step-by-step flows for user actions. |
| [`03_technical_architecture.md`](./docs/03_technical_architecture.md) | System design and technology stack. |
| [`04_data_models.md`](./docs/04_data_models.md) | Database structure and entity relationships. |

---

## Tech Stack

### **Frontend (Mobile)**
- Flutter (Dart)
- Riverpod for state management  
- Secure Storage for token management  
- REST API integration  

### **Backend**
- Node.js + Express  
- PostgreSQL  
- JWT authentication  
- Payment API integrations (Flutterwave)  
- Firebase Cloud Messaging (notifications)  

### **Infrastructure**
- Cloudinary / AWS S3 (media storage)

---

## Environment Variables

All sensitive keys and credentials are managed via an `.env` file.  
To set up your environment, copy `.env.example` into a new `.env` file:

```bash
cp .env.example .env

