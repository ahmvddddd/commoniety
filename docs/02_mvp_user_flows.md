# MVP User Flows

## Overview
This document outlines how users interact with the app in the **Minimum Viable Product (MVP)** version. It defines the primary flows that must exist before public launch.

---

## 1. Onboarding Flow
1. User downloads and opens the app.
2. User signs up using email and password.
3. User enters their BVN for KYC. 
4. System prompts user to set up a **PIN** for wallet access.
5. User lands on the **home screen** showing community overview.

---

## 2. Create Community Fund Flow
1. User taps **“Create Community”**.
2. Enters community name, goal, and description.
3. App generates a **virtual account number**.
4. User shares the account link or account number to collect contributions.

---

## 3. Contribute to a Fund Flow
1. User selects a community fund.
2. Enters contribution amount.
3. Selects transfer funds to the community account.
4. System processes the transaction and updates the community wallet balance.
5. Both contributor and admin receive a success notification.

---

## 4. Withdraw or Use Funds Flow
1. Admin navigates to the fund dashboard.
2. Chooses “Withdraw” and community members receive notification asking for approval.
3. Admin awaits community approval.
4. Backend validates approvals, permissions and balance.
5. Funds are transferred securely.

---

## 5. Notification Flow
- Contributors receive updates for successful payments.
- Community admins get alerts for new contributions and fund milestones.
- Users are notified when goals are achieved or withdrawals are made.

---

## 6. Logout / Re-login Flow
- User logs out securely.
- Upon next login, the user must re-enter password.
