# 🧪 Purple Potion: My Elixir Learning Journey

Welcome to **Purple Potion**! This repository is a collection of my projects as I explore the functional world of **Elixir**. Instead of just one tool, this is an evolving **Learning Roadmap** that demonstrates my progress from basics to more complex functional structures.

## 🎯 Learning Roadmap & Progress

- [x] **Phase 1: Functional Foundations** - Pattern Matching, Immutability, and Modules.
- [x] **Phase 2: Data Manipulation** - Pipe operators (|>), recursion, and working with Lists/Maps.
- [x] **Phase 3: Persistence** - Saving/loading data from the local file system.
- [x] **Phase 4: Concurrency & OTP** - Exploring Processes, GenServers, and Supervisors.
- [ ] **Phase 5: Web Development** - Building real-time applications (Currently exploring Plug & Cowboy, next: Phoenix).

## 🛠 Projects Inside

### 1. Simple Worker & Self-Healing Counter
A stateful process that counts every second and survives crashes.
* **Concepts:** GenServer (State Management), Supervisor (Fault Tolerance).
* **Key Feature:** If the process is killed, the **Supervisor** restarts it automatically, and the worker recovers its last state from `counter.txt`.

### 2. Live Link Monitor
A concurrent tool to check if websites are UP or DOWN.
* **Concepts:** `HTTPoison`, Concurrency (`spawn`), Pattern Matching.
* **Key Feature:** Checks multiple URLs in parallel and logs the status to `link_reports.log`.

### 3. Mini Web Server
A lightweight bridge to expose backend data to the browser.
* **Concepts:** `Plug`, `Cowboy` server, HTTP Routing.
* **Key Feature:** Live access to the counter via `http://localhost:4000` and a remote `/reset` endpoint to control the backend.

### 4. Task Manager
Functional task management logic.
* **Concepts:** List manipulation, Head/Tail pattern matching.
* **Key Feature:** Save and Load tasks from a local `tasks.db` file.

### 5. Pattern Matching Calculator
A safe and clean arithmetic engine.
* **Concepts:** Multiple function clauses, Guard clauses.
* **Key Feature:** Handles division by zero gracefully using pattern matching.

### 6. Currency Converter
A conversion tool using key-value pair structures.
* **Concepts:** Maps, Case statements, Float rounding.
* **Key Feature:** Fixed exchange rates for USD, EUR, TRY, and GBP.

---
*Created with ❤️ while learning Elixir.*
