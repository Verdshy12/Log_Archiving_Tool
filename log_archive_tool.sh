Roadmap [https://roadmap.sh/projects/log-archive-tool] (https://roadmap.sh/projects/log-archive-tool)
---
# Default log source and archive destination
LOG_DIR=${1:-/var/log}
ARCHIVE_DIR=${2:-/var/log_archives}
LOG_FILE="$ARCHIVE_DIR/archive_log.txt"

mkdir -p "$ARCHIVE_DIR"

# Create timestamp for archive name
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="logs_$TIMESTAMP.tar.gz"
ARCHIVE_PATH="$ARCHIVE_DIR/$ARCHIVE_NAME"

# Compress the logs
echo "Archiving logs from: $LOG_DIR"
tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" . 2>/dev/null

if [[ $? -eq 0 ]]; then
    echo "Archive created: $ARCHIVE_PATH"
    echo "$TIMESTAMP - Archived $LOG_DIR to $ARCHIVE_NAME" >> "$LOG_FILE"
else
    echo "Failed to archive logs."
    exit 1
fi
