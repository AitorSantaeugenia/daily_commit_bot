#!/bin/bash

info="feat: $(date)"

echo "$info" >> /home/your-user/Desktop/projects/daily-commit-bot/output.txt
cd /home/your-user/Desktop/projects/daily-commit-bot/
/usr/bin/git add -u
/usr/bin/git commit -m "$info"
/usr/bin/git push
