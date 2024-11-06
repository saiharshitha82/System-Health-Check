# System-Health-Check

System Health Check Script
# Software Versions
1. Bash: Version 4.0+
2. PostgreSQL: Version 12 or higher (if service check is required)
3. Cron: Ensure cron is installed and enabled (for scheduled checks)
# Setup Instructions
### 1. Clone the repository

   git clone https://github.com/saiharshitha82/System-Health-Check.git
  cd your-repository

   
### 3. Download the dataset

This project does not require a dataset. It generates reports based on the current system metrics.

# Project Structure

### database_operations.py
system_health_check.sh

  Main shell script that checks:

  Disk space usage

  CPU load

PostgreSQL service status

Outputs a report in system_health_report.txt

system_health_report.txt

The generated system health report with details about the system’s status for each check.


# Credits
This project was created by Sai Harshitha Mutyala (https://github.com/saiharshitha82) 
