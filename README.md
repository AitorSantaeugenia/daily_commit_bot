# GitHub Commit Bot using Anacron and Cron - Ubuntu only
My implementation of the Daily-Git-Commit in bash, using anacron or crontab: https://github.com/JareBear12418/Daily-Git-Commit <br>
All credito to him.

- Download the code or fork and clone.
- Change the bot paths to your folder paths in the bot.sh file
    - bot.sh -> line 5 and 6, with the path of your cloned folder
    ```
    echo "$info" >> /home/your-user/Desktop/projects/daily-commit-bot/output.txt
    cd /home/your-user/Desktop/projects/daily-commit-bot/
    ```
- Proceed to the desired configuration

# Using anacron and the ~./local folder
- create ~/.local/etc/cron.daily and ~/.var/spool/anacron<br>
    <code>mkdir -p ~/.local/etc/cron.daily ~/.var/spool/anacron</code>
    - Place the script in ~/.local/etc/cron.daily using <code>mv</code> or <code>cp</code> <br>
    - If the name of your script is bot.sh, better to remove the .sh, leaving it as "bot". The extension causes problems using anacron. You can do it with <code>mv bot.sh bot</code>
    - Remember to make the script executable with <code>sudo chmod +x bot.sh </code>
- create anacrontab config file in ~/.local/etc<br>
<code>touch anacrontab</code><br>
- Add this to the anacrontab file: using <code>vim</code>, <code>nano</code> or <code>open</code>

```
SHELL=/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin
1  0  daily.script    run-parts /home/your-user/.local/etc/cron.daily/
```

Note: "daily.script" can be anything you want. Like "cat" or whatever.

- Verify everything works (nothing will happen if no errors):
```
anacron -T -t ~/.local/etc/anacrontab \
-S /home/your-user/.var/spool/anacron
```
- Ensure that it runs with your local configuration (-fn forces anacron to run your cron, so executes the script, and does a commit, just for testing purposes)
```
anacron -fn -t /home/your-user/.local/etc/anacrontab \
-S /home/your-user/.var/spool/anacron
```
- Leave this as your last configuration
```
anacron -t /home/your-user/.local/etc/anacrontab \
-S /home/your-user/.var/spool/anacron
```

All this configuration can be found at: https://opensource.com/article/21/2/linux-automation <br>
More information about anacrontab can be found at: https://www.geeksforgeeks.org/anacron-command-in-linux-with-examples/

# Using crontab -e (easier)
- Using <code>crontab -e </code> and adding these lines (for a push at 16:00 & 21:00)
```
0 16 * * * /bin/bash /home/aitor/Desktop/projects/commit-bot-main/bot.sh
0 21 * * * /bin/bash /home/aitor/Desktop/projects/commit-bot-main/bot.sh
```

