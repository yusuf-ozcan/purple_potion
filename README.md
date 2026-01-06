# 🧪 Purple Potion: My Elixir Learning Journey

Welcome to **Purple Potion**! This repository is a collection of my projects as I explore the functional world of **Elixir**. Instead of just one tool, this is an evolving **Learning Roadmap** that demonstrates my progress from basics to more complex functional structures.

## 🎯 Learning Roadmap & Progress

- [x] **Phase 1: Functional Foundations** - Pattern Matching, Immutability, and Modules.
- [x] **Phase 2: Data Manipulation** - Pipe operators (|>), recursion, and working with Lists/Maps.
- [x] **Phase 3: Persistence** - Saving/loading data from the local file system.
- [x] **Phase 4: Concurrency & OTP** - Processes, GenServers, and Fault-Tolerant Supervision.
- [x] **Phase 5: Web & APIs** - Building JSON APIs with Plug & Cowboy (Next: Phoenix Framework).

## 🛠 Projects Inside

### 1. Purple Exchange API (New! 🌐)
A microservice that fetches real-time currency rates from an external API and serves them via JSON.
* **Concepts:** External HTTP Requests (`HTTPoison`), JSON Serialization (`Jason`), Periodic State Updates.
* **Key Feature:** A background **GenServer** updates rates every hour, serving live data on `http://localhost:4001/rates`.



### 2. Simple Worker & Self-Healing Counter
A stateful process that counts every second and survives intentional or accidental crashes.
* **Concepts:** GenServer (State Management), Supervisor (Fault Tolerance).
* **Key Feature:** If the process is killed, the **Supervisor** restarts it instantly, recovering the last state from `counter.txt`.

### 3. Mini Web Server
A lightweight bridge exposing internal backend data to the web browser.
* **Concepts:** `Plug`, `Cowboy` server, Multi-port Routing (Running on Port 4000).
* **Key Feature:** Live counter access and a remote `/reset` endpoint to control backend logic via HTTP.

### 4. Live Link Monitor
A concurrent tool to check the health of multiple websites simultaneously.
* **Concepts:** Task Spawning, Pattern Matching on HTTP responses.
* **Key Feature:** Checks multiple URLs in parallel without blocking and logs results to `link_reports.log`.

### 5. Task Manager
Functional task management core with local storage.
* **Concepts:** List manipulation, Recursive File I/O.
* **Key Feature:** Robust Save/Load system using a local `tasks.db`.

### 6. Pattern Matching Calculator & Currency Converter
Early-stage functional tools for arithmetic and fixed-rate conversions.
* **Concepts:** Guard clauses, Map structures, Multi-clause functions.

---
*Created with ❤️ while mastering Elixir and OTP.*
