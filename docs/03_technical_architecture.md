 # Technical Architecture (MVP Phase 1)

This defines how the MVP will be structured around the three core user flows.

---

## 1. System Overview

Mobile App (Flutter) │ ▼ Backend API (Node.js + Express) │ ▼ Database (PostgreSQL)

Mock or sandbox provider is used to simulate deposits and payouts. Notifications are in-app only for MVP.

---

## 2. Backend Modules

### Auth & Users
- Email/password login
- JWT tokens

### Groups & Memberships
- Create group
- Roles: Owner, Treasurer, Member
- Invite via link or code

### Ledger & Contributions
- Double-entry style ledger
- Mock contributions (MVP)
- Sandbox webhook (later)

### Withdrawals & Approvals
- Create withdrawal request
- Officers approve
- Mock payout after approval

### Notifications (In-App)
- Deposit
- Withdrawal request
- Approval
- Payout
- Expiry/reject

---

## 3. API Endpoints (MVP)

POST   /auth/register POST   /auth/login

POST   /groups POST   /groups/{id}/invite

POST   /groups/{id}/contributions/mock POST   /webhooks/deposit     (later phase)

POST   /groups/{id}/withdrawals POST   /withdrawals/{id}/approve

---

## 4. Environments

- dev (local)
- stage (optional sandbox)
- prod (after MVP)

`.env` holds secrets and sandbox keys.

---

## 5. Non-Functional Requirements

- JWT auth  
- Role-based access  
- JSON error handling  
- Idempotency for contributions & approvals  
- Logging  
- Secure env config
