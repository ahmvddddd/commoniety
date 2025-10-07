# MVP User Flows

This document defines the only three user flows that will be implemented in Phase 1.

---

## 1. Create Group & Invite Members
**Actor:** Group Owner (or any registered user)
1. User signs up or logs in (email + password only).2. User taps **“Create Group”**.3. Enters group name and optional description.4. Default rule template is applied (no custom settings in MVP).5. System generates a unique **Group ID or Join Code**.6. User invites others via link or code.
_No BVN, PIN or KYC for MVP._

---

## 2. Contribute to Group Wallet
**Actor:** Group Member
### Mock Mode (MVP)1. Member opens a group they belong to.2. App displays a **demo virtual account number** (e.g. `VA-DEMO-{groupId}`).3. Member taps **“Contribute (Demo)”**, enters amount and submits.4. Backend creates a **ledger credit** with:   - amountKobo, currency, groupId, memberId   - source = `"demo"`   - simulated = `true`5. Group balance updates immediately.6. Officers and contributor receive notification.
### Sandbox Mode (Later Phase)Same flow, but via webhook from provider sandbox.

---

## 3. Withdrawal with Approval
**Actors:** Treasurer or Owner (request), Officers (approve)
1. Treasurer/Owner initiates withdrawal (amount + reason).2. Officers receive notification to approve.3. Approvals follow default template (e.g. 2 officers).4. Once approval threshold is met:   - System marks as approved   - Mock/sandbox payout is triggered5. Transaction is recorded in ledger.6. Notifications sent to relevant members.

---

## Notifications (MVP Only)
These events trigger in-app notifications:
- Deposit received  - Withdrawal requested  - Approval added  - Payout completed  - Request expired or rejected (optional)

---

## Out of Scope (Phase 1)
 No BVN / NIN / PIN   No goals or milestones   No bill payments or loans   No personal wallets   No chat features
