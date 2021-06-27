# 2FA-SSH-Shell
Two-Factor Authentication with Telegram Bot for SSH / Shell Login

# Setup

### Create Your Own Bot:
Chat `@BotFather` with `/newbot`

### Setup Bot for OTP Sender
- Open your API: `https://api.telegram.org/bot[HTTP_API_KEY]/getUpdates`
- Chat your Telegram Bot
- Copy your `Chat ID`
![BOT Chat ID](https://raw.githubusercontent.com/bensofficial/2FA-SSH-Shell/master/Screenshot/BOT-API-GetUpdates.png)
- Download `shell2FA` source
- Change configuration `API KEY` & `Chat ID` & `URGENT_KEY` on "shell2FA" source
- Move `shell2FA` to `/bin/` (`mv shell2FA /bin/`)
- `chmod +x /bin/shell2FA`
- Add `/bin/shell2FA` to `/etc/shells`
### Setup user for OTP Login
- Add a user: `adduser [NAME]`
- Change the default shell: `usermod --shell /bin/shell2FA [NAME]`
- Optional: Check whether it was successfull: `grep [NAME] /etc/passwd`
![/etc/passwd](https://raw.githubusercontent.com/bensofficial/2FA-SSH-Shell/master/Screenshot/etc-passwd.png)
- Add the user to the ssh group: `adduser [NAME] ssh`
