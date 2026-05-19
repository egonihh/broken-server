# CM-204 — Broken Server Demo
## How to Run

---

### Step 1 — Get the files

Open the terminal on your lab machine and run:

```bash
git clone https://github.com/egonihh/broken-server.git
cd broken-server/broken_server
```

---

### Step 2 — Run the setup

```bash
./setup.sh
```

This breaks the environment silently. Run it once before the demo starts.

---

### Step 3 — Work through the rooms in order

Each room has a scroll (the story + task) and a check script (verifies your fix).

```bash
cd room1_permissions
cat scroll        # read the task
# fix the problem live
bash check        # verify your fix — shows PASS or FAIL
```

Then move to the next room:

```bash
cd ../room2_path && cat scroll
cd ../room3_process && cat scroll
cd ../room4_logs && cat scroll
```

---

### If something goes wrong

Just reset everything by opening a **fresh terminal** and running:

```bash
cd broken-server/broken_server
./setup.sh
```
