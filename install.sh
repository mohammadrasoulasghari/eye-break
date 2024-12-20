#!/bin/bash

# بررسی دسترسی ریشه
if [ "$EUID" -ne 0 ]; then
  echo "لطفاً اسکریپت نصب را با دسترسی ریشه (sudo) اجرا کنید."
  exit 1
fi

echo "=== EyeBreak Installation ==="

# بررسی و نصب zenity در صورت نیاز
if ! command -v zenity &> /dev/null; then
    echo "Zenity پیدا نشد. می‌خواهید zenity را نصب کنید؟ (y/n)"
    read -p "انتخاب شما: " INSTALL_ZENITY
    if [[ "$INSTALL_ZENITY" =~ ^[Yy]$ ]]; then
        apt-get update
        apt-get install -y zenity
        if [ $? -ne 0 ]; then
            echo "نصب zenity با شکست مواجه شد. نصب متوقف شد."
            exit 1
        fi
        echo "zenity با موفقیت نصب شد."
    else
        echo "بدون نصب zenity، برنامه نمی‌تواند نوتیفیکیشن‌ها را نمایش دهد. نصب متوقف شد."
        exit 1
    fi
else
    echo "zenity قبلاً نصب شده است."
fi

# کپی اسکریپت یادآوری به /usr/local/bin
echo "در حال کپی اسکریپت یادآوری به /usr/local/bin/eye_reminder.sh..."
cp eye_reminder.sh /usr/local/bin/eye_reminder.sh
chmod +x /usr/local/bin/eye_reminder.sh
if [ $? -eq 0 ]; then
    echo "اسکریپت یادآوری با موفقیت کپی شد."
else
    echo "خطا در کپی اسکریپت. نصب متوقف شد."
    exit 1
fi

# افزودن کرون جاب
CRON_JOB="*/20 * * * * /usr/local/bin/eye_reminder.sh"

# بررسی اینکه آیا کرون جاب قبلاً اضافه شده است یا نه
(crontab -l 2>/dev/null | grep -F "$CRON_JOB") 
if [ $? -ne 0 ]; then
    echo "افزودن کرون جاب برای اجرای اسکریپت هر ۲۰ دقیقه..."
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    if [ $? -eq 0 ]; then
        echo "کرون جاب با موفقیت اضافه شد."
    else
        echo "خطا در افزودن کرون جاب."
        exit 1
    fi
else
    echo "کرون جاب از قبل وجود دارد."
fi

echo "=== نصب EyeBreak کامل شد! ==="
echo "نوتیفیکیشن‌ها هر ۲۰ دقیقه یکبار نمایش داده خواهند شد."
