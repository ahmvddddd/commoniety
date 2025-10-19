Use UUIDs from the extension we enabled
-- 1) Users
INSERT INTO "user"(id,email,password_hash,name) VALUES
  (uuid_generate_v4(),'owner@example.com','hash','Owner One'),
  (uuid_generate_v4(),'treasurer@example.com','hash','Treasurer Two');

-- 2) Group (owned by first user)
WITH u AS (SELECT id FROM "user" WHERE email='owner@example.com' LIMIT 1)
INSERT INTO "group"(id,name,description,rule_template,approvals_required,approvals_cap,created_by)
SELECT uuid_generate_v4(),'Alumni Set 2015','Demo group','two_officer',2,3,id FROM u;

-- 3) Memberships
WITH g AS (SELECT id FROM "group" WHERE name='Alumni Set 2015'),
     u AS (SELECT id,email FROM "user")
INSERT INTO group_membership(id,group_id,user_id,role_in_group,joined_at)
SELECT uuid_generate_v4(), g.id, (SELECT id FROM "user" WHERE email='owner@example.com'),'OWNER', now() FROM g
UNION ALL
SELECT uuid_generate_v4(), g.id, (SELECT id FROM "user" WHERE email='treasurer@example.com'),'TREASURER', now() FROM g;

-- 4) Account for the group
WITH g AS (SELECT id FROM "group" WHERE name='Alumni Set 2015')
INSERT INTO account(id,group_id,virtual_account_number,provider_ref,created_at)
SELECT uuid_generate_v4(), g.id, 'VA-DEMO-'||LEFT(g.id::text,8), NULL, now() FROM g;

-- 5) Credits (simulate two contributions)
WITH g AS (SELECT id FROM "group" WHERE name='Alumni Set 2015'),
     a AS (SELECT id FROM account LIMIT 1),
     owner AS (SELECT id FROM "user" WHERE email='owner@example.com'),
     treas AS (SELECT id FROM "user" WHERE email='treasurer@example.com')
INSERT INTO ledger_entry(id,group_id,account_id,type,amount_kobo,currency,source,reference,simulated,user_id,created_at)
SELECT uuid_generate_v4(), g.id, a.id,'CREDIT',5000000,'NGN','demo','ref_demo_1',true, (SELECT id FROM owner), now() FROM g,a
UNION ALL
SELECT uuid_generate_v4(), g.id, a.id,'CREDIT',2500000,'NGN','demo','ref_demo_2',true, (SELECT id FROM treas), now() FROM g,a;

-- 6) Debit (simulate one payout of 3,000,000 kobo = ₦30,000)
WITH g AS (SELECT id FROM "group" WHERE name='Alumni Set 2015'),
     a AS (SELECT id FROM account LIMIT 1)
INSERT INTO ledger_entry(id,group_id,account_id,type,amount_kobo,currency,source,reference,simulated,created_at)
SELECT uuid_generate_v4(), g.id, a.id,'DEBIT',3000000,'NGN','payout','ref_demo_3',false, now() FROM g,a;

-- 7) Quick checks
-- Expected group balance: 5,000,000 + 2,500,000 - 3,000,000 = 4,500,000 kobo (₦45,000)

-- View balances
SELECT * FROM vw_group_balance;

-- Member contributions (should show both users and their totals)
SELECT * FROM vw_member_contributions ORDER BY group_id, user_id;

-- psql -d community_wallet -f server/db/seed_c2.sql

-- Results
| group_id                             | user_id                              | total_contributed_kobo |
| ------------------------------------ | ------------------------------------ | ---------------------- |
| 09e7a2ad-25c4-4820-9dbc-35439a133b8e | 40385fa1-4d2f-4116-800b-da941a4bf8c9 | 2500000                |
| 09e7a2ad-25c4-4820-9dbc-35439a133b8e | 9898960e-af02-4838-b877-3478a4119018 | 5000000                |
