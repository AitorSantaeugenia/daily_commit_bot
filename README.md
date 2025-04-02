# Daily Commit Bot

A bash script implementation for automated daily Git commits, inspired by [Daily-Git-Commit](https://github.com/JareBear12418/Daily-Git-Commit). All credit goes to the original author.

<div align="center">

![rudimentary-bot](https://user-images.githubusercontent.com/14861253/199794306-4f53a822-8f10-4aeb-b993-a76c2b9fc77f.gif)

</div>

## Quick Start

1. Download the code or fork and clone the repository
2. Update the paths in `bot.sh`:
   ```bash
   # Update these lines with your folder paths
   echo "$info" >> /home/your-user/Desktop/projects/daily-commit-bot/output.txt
   cd /home/your-user/Desktop/projects/daily-commit-bot/
   ```
3. Choose your preferred configuration method below

## Configuration Options

### Option 1: Using Anacron (Recommended)

1. Create required directories:
   ```bash
   mkdir -p ~/.local/etc/cron.daily ~/.var/spool/anacron
   ```

2. Set up the script:
   - Move the script to `~/.local/etc/cron.daily/`
   - Rename `bot.sh` to `bot` (remove extension to avoid anacron issues):
     ```bash
     mv bot.sh bot
     ```
   - Make the script executable:
     ```bash
     sudo chmod +x bot
     ```

3. Configure Anacron:
   - Create anacrontab config file:
     ```bash
     touch ~/.local/etc/anacrontab
     ```
   - Add the following configuration (using your preferred editor):
     ```bash
     SHELL=/bin/sh
     PATH=/sbin:/bin:/usr/sbin:/usr/bin
     1  0  daily.script    run-parts /home/your-user/.local/etc/cron.daily/
     ```
     Note: "daily.script" can be any identifier you prefer

4. Test the configuration:
   ```bash
   # Verify setup (no output means no errors)
   anacron -T -t ~/.local/etc/anacrontab -S /home/your-user/.var/spool/anacron

   # Test execution
   anacron -fn -t /home/your-user/.local/etc/anacrontab -S /home/your-user/.var/spool/anacron
   ```

5. Final configuration:
   ```bash
   anacron -t /home/your-user/.local/etc/anacrontab -S /home/your-user/.var/spool/anacron
   ```

### Option 2: Using Crontab (Simpler)

1. Open crontab editor:
   ```bash
   crontab -e
   ```

2. Add the following lines (example for commits at 16:00 and 21:00):
   ```bash
   0 16 * * * /bin/bash /home/your-user/Desktop/projects/daily-commit-bot/bot.sh
   0 21 * * * /bin/bash /home/your-user/Desktop/projects/daily-commit-bot/bot.sh
   ```

## Additional Resources

- [Linux Automation Guide](https://opensource.com/article/21/2/linux-automation)
- [Anacron Command Guide](https://www.geeksforgeeks.org/anacron-command-in-linux-with-examples/)

## The Dream

<div align="center">
    
<img src="./github_.jpg" alt="The Dream" width="400" height="400" />

</div>
