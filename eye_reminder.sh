#!/bin/bash

# نمایش نوتیفیکیشن با استفاده از zenity
zenity --info \
  --title="یادآوری EyeBreak" \
  --text="<span size='x-large' foreground='red'>خداقوت! 😊</span>\n\n<span size='large' foreground='black'>برای سلامتی چشم هات همین الآن یه ۲۰ ثانیه به یه نقطه دور نگاه کن. خیلی این خوبه برات چون تقریبا ۲۰ دقیقه است که مانیتور خیره شدی.</span>" \
  --width=500 \
  --height=200 \
  --ok-label="نگاه کردم"
