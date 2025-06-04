# 🏥 Health Log Management System

This project implements an **automated log management and analysis system** for monitoring real-time patient data in a hospital setting using **shell scripting and Python simulators**.

---

## 📦 Project Structure

```
Coding-lab_Group{Nbr}/
├── archive_logs.sh                  # Archiving logs with timestamp
├── analyze_logs.sh                  # Analyzing logs for device stats
├── heart_monitor.py                 # Simulates heart rate data
├── temp_sensor.py                   # Simulates temperature data
├── water_meter.py                   # Simulates water usage
├── hospital_data/
│   ├── active_logs/                 # Directory for real-time logs
│   ├── heart_data_archive/          # Archived heart rate logs
│   ├── temperature_data_archive/    # Archived temperature logs
│   └── water_usage_data_archive/    # Archived water usage logs
└── reports/
    └── analysis_report.txt          # Cumulative report of analyses
```

---

## 🚀 How It Works

### 1. **Python Simulators**
Each Python file simulates medical/environmental data using random values and logs it in real-time.

- `heart_monitor.py`  
  - Devices: `HeartRate_Monitor_A`, `HeartRate_Monitor_B`
  - Data: Random heart rates (60–100 bpm)

- `temp_sensor.py`  
  - Devices: `Temp_Recorder_A`, `Temp_Recorder_B`
  - Data: Random temperatures (36.0–39.5 °C)

- `water_meter.py`  
  - Device: `Water_Consumption_Meter`
  - Data: Random usage (1–10 liters)

They write logs to: `hospital_data/active_logs/*.log`

### 2. **Shell Scripts**

#### 🗂️ `archive_logs.sh`
- Interactive script to select which log to archive:
  - Prompts user to choose a log file (heart rate, temperature, or water usage)
  - Archives the file by:
    - Moving it to the correct archive folder
    - Renaming it with a timestamp (`heart_rate_YYYY-MM-DD_HH:MM:SS.log`)
    - Creating a new blank log file for continued logging
- Handles missing files and invalid input gracefully.

#### 📊 `analyze_logs.sh`
- Analyzes the selected log file and generates a report:
  - Counts how many entries each device has logged
  - Retrieves the first and last log timestamps per device
  - Appends the results to `reports/analysis_report.txt`

---

## 🛠️ Usage Instructions

### Step 1: Create Required Folders

Run this once to set up your directories:
```bash
mkdir -p hospital_data/active_logs
mkdir -p hospital_data/heart_data_archive
mkdir -p hospital_data/temperature_data_archive
mkdir -p hospital_data/water_usage_data_archive
mkdir -p reports
```

### Step 2: Start Simulators

Open **3 separate terminals** and run:

```bash
python3 heart_monitor.py start
python3 temp_sensor.py start
python3 water_meter.py start
```

### Step 3: Archive Logs (when needed)

```bash
./archive_logs.sh
```

- Select a log to archive (1–3).
- Script moves it, renames it with a timestamp, and starts a fresh one.

### Step 4: Analyze Logs

```bash
./analyze_logs.sh
```

- Choose a log to analyze.
- A report is appended to `reports/analysis_report.txt` with:
  - Total entries per device
  - First and last timestamps

---

## 📚 Learning Objectives

- **Shell Scripting Proficiency**
  - Menu systems, file handling, error checking
- **Log Management & Automation**
  - Archiving logs with rotation and timestamping
- **Data Analysis with CLI Tools**
  - Using `awk`, `grep`, `sort`, and `uniq` for analysis
  - Writing cumulative reports

---

## ✅ Example Output (Analysis Report)
```
==== Log Analysis: heart_rate_log.log ====
Timestamp: 2025-06-03 13:10:55
Device: HeartRate_Monitor_A | Count: 63 | First: 2025-06-03 13:08:10 | Last: 2025-06-03 13:09:13
Device: HeartRate_Monitor_B | Count: 63 | First: 2025-06-03 13:08:10 | Last: 2025-06-03 13:09:13
```

---

## 🧼 To Stop Simulators

```bash
python3 heart_monitor.py stop
python3 temp_sensor.py stop
python3 water_meter.py stop
```

---

## 📌 Notes

- Ensure you run the scripts from the **project root directory**.
- The scripts use relative paths like `hospital_data/active_logs`, so changing structure may require updates.

---

## 🔗 License

MIT — Feel free to adapt and build upon this project.
