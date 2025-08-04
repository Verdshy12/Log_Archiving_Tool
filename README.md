From Roadmap [https://roadmap.sh/projects/log-archive-tool](https://roadmap.sh/projects/log-archive-tool)

---

To make it executable, run on your terminal: 
    
    chmod +x log_archive_tool.sh
---
    
You can also run manually from default file path (/var/log):
    
    sudo ./log_archive_tool.sh
 
Run with custom source and destination:

    sudo ./log_archive_tool.sh /path/to/logs /path/to/archive

To remove archives older than 30 days, add this to the script (after the archive is created):

    find "$ARCHIVE_DIR" -name "*.tar.gz" -mtime +30 -exec rm {} \;

