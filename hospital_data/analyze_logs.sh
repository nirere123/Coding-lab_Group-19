#!/bin/bash

# Base directories
baseDir="archived_logs/"
activeLogDir="active_logs/"
reportDir="reports/"
reportFile="${reportDir}analysis_report.txt"

# Ensure required directories exist
mkdir -p "$reportDir" || {
    echo "Error: Failed to create required directories."
    exit 1
}

# Archive subdirectories
heartDir="${baseDir}heart_data_archive/"
temperatureDir="${baseDir}temperature_data_archive/"
waterDir="${baseDir}water_usage_data_archive/"

# Get timestamp
timestamp=$(date +"%Y-%m-%d_%H:%M:%S")

# Display menu
while true; do
    echo "Select log to archive:"
    echo "1) Heart Rate"
    echo "2) Temperature"
    echo "3) Water Usage"
    echo -n "Enter choice (1-3): "
    read LogFile

    case $LogFile in
        1)
            logName="heart_rate_log.log"
            destDir="$heartDir"
            prefix="heart_rate_log"
            logLabel="Heart Rate"
            ;;
        2)
            logName="temperature_log.log"
            destDir="$temperatureDir"
            prefix="temperature_log"
            logLabel="Temperature"
            ;;
        3)
            logName="water_usage_log.log"
            destDir="$waterDir"
            prefix="water_usage_log"
            logLabel="Water Usage"
            ;;
        *)
            echo "Invalid selection. Please enter 1, 2, or 3."
            continue
            ;;
    esac

      logPath="${activeLogDir}${logName}"
    archivePath="${destDir}${prefix}_$timestamp.log"

    # Ensure log file exists
    if [[ ! -f "$logPath" ]]; then
        echo "Error: Log file '$logPath' does not exist."
        exit 1
    fi

    # Create archive directory if needed
    mkdir -p "$destDir" || {
        echo "Error: Failed to create archive directory."
        exit 1
    }

    # Move and archive log file
    mv "$logPath" "$archivePath"
    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to archive $prefix."
        exit 1
    fi

    echo "$logLabel log archived successfully."


