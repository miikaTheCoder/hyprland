#!/bin/bash

STATE_FILE="/tmp/waybar-upload-speed.state"
# Detect the default network interface (e.g., eth0, wlan0)
DEFAULT_INTERFACE=$(ip route | grep default | awk '{print $5}' | head -n 1)

if [ -z "$DEFAULT_INTERFACE" ]; then
  echo "Error: No default network interface found." >&2
  echo "⤴️ N/A"
  exit 1
fi

# Function to format bytes for display
format_bytes() {
  local bytes=$1
  local unit=""
  local value=""

  if (($(echo "$bytes < 1024" | bc -l))); then
    value=$(printf "%.0f" "$bytes")
    unit="B/s"
  elif (($(echo "$bytes < 1048576" | bc -l))); then # 1024 * 1024 = 1MB
    value=$(printf "%.1f" $(echo "$bytes / 1024" | bc -l))
    unit="KB/s"
  elif (($(echo "$bytes < 1073741824" | bc -l))); then # 1024 * 1024 * 1024 = 1GB
    value=$(printf "%.1f" $(echo "$bytes / 1048576" | bc -l))
    unit="MB/s"
  else
    value=$(printf "%.1f" $(echo "$bytes / 1073741824" | bc -l))
    unit="GB/s"
  fi
  echo "${value}${unit}"
}

# Read current transmit bytes for the interface
# This reads the 10th column (tx_bytes) from /proc/net/dev for the given interface.
CURRENT_TX_BYTES=$(grep "$DEFAULT_INTERFACE:" /proc/net/dev | awk '{print $10}')
CURRENT_TIMESTAMP=$(date +%s) # Seconds timestamp

if [ -z "$CURRENT_TX_BYTES" ]; then
  echo "Error: Could not read transmit bytes for $DEFAULT_INTERFACE." >&2
  echo "⤴️ N/A"
  exit 1
fi

# Check if a state file exists from a previous run
if [ -f "$STATE_FILE" ]; then
  # Read previous timestamp and bytes from the state file
  readarray -t PREV_DATA <"$STATE_FILE"
  PREV_TIMESTAMP=${PREV_DATA[0]}
  PREV_TX_BYTES=${PREV_DATA[1]}

  # Ensure previous data is valid
  if [ -n "$PREV_TX_BYTES" ] && [ -n "$PREV_TIMESTAMP" ]; then
    # Calculate the change in bytes and time
    DELTA_BYTES=$((CURRENT_TX_BYTES - PREV_TX_BYTES))
    DELTA_TIME=$((CURRENT_TIMESTAMP - PREV_TIMESTAMP))

    # Avoid division by zero and handle counter resets (e.g., after reboot)
    if [ "$DELTA_TIME" -gt 0 ] && [ "$DELTA_BYTES" -ge 0 ]; then
      # Calculate speed in bytes per second
      SPEED_BPS=$((DELTA_BYTES / DELTA_TIME))
      FORMATTED_SPEED=$(format_bytes "$SPEED_BPS")
      echo "⤴️ $FORMATTED_SPEED" # Output for Waybar
    else
      echo "⤴️ 0B/s" # No change or initial run issue after reboot
    fi
  else
    echo "⤴️ 0B/s" # State file corrupted or empty, treat as 0 for now
  fi
else
  echo "⤴️ 0B/s" # First run, no state file yet
fi

# Store current state for the next run
echo "$CURRENT_TIMESTAMP" >"$STATE_FILE"
echo "$CURRENT_TX_BYTES" >>"$STATE_FILE"
