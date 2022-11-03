#!/bin/bash

info="feat: $(date)"

echo "$info" >> /home/your-user/Desktop/projects/commit-bot-main/output.txt
cd /home/your-user/Desktop/projects/commit-bot-main/
/usr/bin/git add -u
/usr/bin/git commit -m "$info"
/usr/bin/git push
