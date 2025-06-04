#!/bin/bash

# Create base archive directory
baseDir="archived_logs/"
mkdir -p "$baseDir"

# Define subdirectories for archived logs
heartDir="${baseDir}heart_data_archive/"
temperatureDir="${baseDir}temperature_data_archive/"
waterDir="${baseDir}water_usage_data_archive/"

# Define active logs directory
activeLogDir="active_logs/"

# Get timestamp
timestamp=$(date +"%Y-%m-%d_%H:%M:%S")

# Loop until valid input
while true; do
    echo "Select log to archive:"
    echo "1) Heart Rate"
    echo "2) Temperature"
    echo "3) Water Usage"
    echo -n "Enter choice (1-3): "
    read LogFile
    
    case $LogFile in
        1)
            if [[ -f "${activeLogDir}heart_rate_log.log" ]]; then
                echo "Archiving heart_rate_log.log..."
                mkdir -p "$heartDir"
                mv "${activeLogDir}heart_rate_log.log" "${heartDir}heart_rate_log_$timestamp.log" && \
                echo "Heart rate log archived successfully."
                break
            else
                echo "Heart rate log file does not exist in the active logs directory."
                echo "Please ensure the heart rate monitoring process is running and has generated a log file."
                echo "Exiting without archiving."
                exit 1
            fi
            
        ;;
         2)
            if [[ -f "${activeLogDir}temperature_log.log" ]]; then
                echo "Archiving temperature_log.log..."
                mkdir -p "$temperatureDir"
                mv "${activeLogDir}temperature_log.log" "${temperatureDir}temperature_log_$timestamp.log" && \
                echo "Temperature log archived successfully."
                break
            else
                echo "Temperature log file does not exist in the active logs directory."
                echo "Please ensure the temperature monitoring process is running and has generated a log file."
                echo "Exiting without archiving."
                exit 1
            fi
        ;;
        
    esac
done
