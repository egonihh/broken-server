# CM-204 — Broken Server Diagnostics
## Project 1 Demo Package

---

## What is this?

This is a structured live demo for CM-204 Project 1.
It simulates a Linux server that has been broken by a careless intern.
Your team diagnoses and fixes four real problems, live in the terminal.

The format is inspired by bashcrawl — each problem is a "room" with a
scroll to read and a check script to verify your fix.

---

## Structure

```
broken_server/
├── setup.sh              ← Run this ONCE before the demo starts
├── README.md             ← This file
├── room1_permissions/
│   ├── scroll            ← Read this first (cat scroll)
│   └── check             ← Run this to verify your fix (bash check)
├── room2_path/
│   ├── scroll
│   └── check
├── room3_process/
│   ├── scroll
│   └── check
└── room4_logs/
    ├── scroll
    └── check
```

---

## The Four Problems

| Room | Problem | Skills Covered |
|------|---------|----------------|
| room1_permissions | A script has had all permissions stripped | `chmod`, `stat`, `ls -l` |
| room2_path | A tool exists but the shell can't find it | `echo $PATH`, `export`, `which` |
| room3_process | A rogue process is hammering the CPU | `top`, `ps`, `/proc`, signals |
| room4_logs | Suspicious content hidden in log files | `find`, `wc`, `sort`, `grep` |

---

## How to Run the Demo

### Before the presentation (setup)

1. Open a **fresh terminal** on the lab machine
2. Navigate to the broken_server folder:
   ```bash
   cd broken_server
   ```
3. Run the setup script:
   ```bash
   ./setup.sh
   ```
   This silently breaks the environment. The audience does not see this.

### During the presentation

Each person takes their room(s) in order:

**Person 1 — Rooms 1 & 2**
```bash
cd room1_permissions && cat scroll
# ... diagnose and fix live ...
bash check
cd ../room2_path && cat scroll
# ... diagnose and fix live ...
bash check
```

**Person 2 — Room 3**
```bash
cd ../room3_process && cat scroll
# ... diagnose and fix live ...
bash check
```

**Person 3 — Room 4**
```bash
cd ../room4_logs && cat scroll
# ... diagnose and fix live ...
bash check
```

---

## Tips

- Always `cat scroll` first when entering a room — it sets the scene
- Run `bash check` after fixing each problem to confirm it worked
- You can run `bash check` as many times as you like — it is non-destructive
- If something goes wrong, re-run `./setup.sh` from a fresh terminal to reset everything
- Practice the full demo at least once together before presentation day

---

## Resetting

To reset the entire environment back to broken:

```bash
# From a fresh terminal
cd broken_server
./setup.sh
```

---

## Presentation Day Checklist

- [ ] Open a fresh terminal
- [ ] Run `./setup.sh`
- [ ] Confirm all four problems exist before starting
- [ ] Each person knows their section and can explain every command
- [ ] Everyone can answer questions about the other sections too
