# Backup Helper Scripts

    git clone https://github.com/by-implication/backup-bin.git ~/bin

These are helper scripts for backing up via duplicity. We assume there is a backup user and this repo will be in `~/bin`.

For the scripts to work, it's necessary to have a `config.sh` which contains the encryption settings. You also need `prepare_backup` which will prepare any files you want backed up into the `~/staging` folder. For some kinds of backup, it may be necessary to have root permissions to get things to be backed up. In this case, you can set `USE_SUDO` in the config to `yes` and add ~/bin/prepare_backup to sudoers for the backup user. It's probably a good idea to make the script read-only and owned by root if you're going to do this.
