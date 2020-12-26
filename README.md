# Bash Configuration Setup
This tool assumes you've cloned this repo into your home directory (`~/bash-nix-setup`).
If you've cloned it somewhere else you'll need to adjust the path on line 1 of `template.bashrc` to point to the actual location.
You'll also need to adjust the path in step 2 of the setup instructions below.

**Step 1:** Backup the current bash configuration
```
cp ~/.bashrc ~/.bashrc.bak
```
**Step 2:** Copy contents of `template.bashrc` into `~/.bashrc`
```
cat ~/bash-nix-setup/template.bashrc > ~/.bashrc
```
**Step 3:** Reload the bash configuration of any open terminals
```
source ~/.bashrc
```

