#!/bin/bash

# بررسی دسترسی ریشه
if [ "$EUID" -ne 0 ]; then
  echo "لطفاً اسکریپت حذف نصب را با دسترسی ریشه (sudo) اجرا کنید."
  exit 1
fi

echo "=== EyeBreak Uninstallation ==="

# تعریف کرون جاب
CRON_JOB="*/20 * * * * /usr/local/bin/eye_reminder.sh"

# بررسی وجود کرون جاب
crontab -l 2>/dev/null | grep -F "$CRON_JOB" > /dev/null
if [ $? -eq 0 ]; then
    echo "حذف کرون جاب..."
    crontab -l 2>/dev/null | grep -Fv "$CRON_JOB" | crontab -
    if [ $? -eq 0 ]; then
        echo "کرون جاب با موفقیت حذف شد."
    else
        echo "خطا در حذف کرون جاب."
        exit 1
    fi
else
    echo "کرون جاب یافت نشد."
fi

# حذف اسکریپت یادآوری
if [ -f /usr/local/bin/eye_reminder.sh ]; then
    echo "حذف اسکریپت یادآوری..."
    rm /usr/local/bin/eye_reminder.sh
    if [ $? -eq 0 ]; then
        echo "اسکریپت یادآوری با موفقیت حذف شد."
    else
        echo "خطا در حذف اسکریپت یادآوری."
        exit 1
    fi
else
    echo "اسکریپت یادآوری یافت نشد."
fi

echo "=== حذف نصب EyeBreak کامل شد! ==="
