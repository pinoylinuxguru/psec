#!/bin/sh
#Be sure mailx is install -> rpm -qi mailx 
#if not installed run -> yum install mailx -y
#Aeonmike - PinoyLinux - PCG

AUDITOR="automated"
DATE=$(date +%Y%m%d)
HOST=$(hostname -s)
LOG_DIR="/var/log/lynis"
REPORT="$LOG_DIR/report-${HOST}.${DATE}"
DATA="$LOG_DIR/report-data-${HOST}.${DATE}.txt"
LYNIS=/usr/bin/lynis

# Run Lynis
${LYNIS} audit system --auditor "${AUDITOR}" --cronjob > ${REPORT}

# Optional step: Move report file if it exists
if [ -f /var/log/lynis-report.dat ]; then
    mv /var/log/lynis-report.dat ${DATA}
fi

# Send report via email
MAIL=/usr/bin/mail
EMAILTO=mike.cabalin@gmail.com

${MAIL} -s "Lynis Report for ${HOST}" ${EMAILTO} < ${REPORT}

# The End
