#!/bin/bash
# 2FA SSH SHELL LOGIN INSTALLATION SCRIPT

URL="https://raw.githubusercontent.com/bensofficial/2FA-SSH-Shell/master/shell2FA"

echo ""
echo " --------------------- "
echo " | 2 F A - S h e l l | "
echo " |     L o g i n     | "
echo " |   I n s t a l l   | "
echo " --------------------- "
echo ""

echo "First, a Telegram bot is needed. Chat @BotFather with /newbot."
echo -ne " Input APIKEY : "
read APIKEY

echo "Now chat you bot and get your CHATID from https://api.telegram.org/bot$APIKEY/getUpdates"
echo -ne " Input CHATID : "
read CHATID

echo "What shell do you want to use after the 2FA login?"
echo -ne " Input RECALL_SHELL : "
read RECALL_SHELL

echo "In the case of a failure sending the OTP code, you need a urgent key"
echo -ne " Input URGENT_KEY : "
read URGENT_KEY

echo "Fetching shell from $URL"
curl -fsSL $URL -o shell2FA

echo "Configuring"
sed -i '/RECALL_SHELL/c\RECALL_SHELL='+$RECALL_SHELL shell2FA
sed -i '/URGENT_KEY/c\URGENT_KEY='+$URGENT_KEY shell2FA
sed -i '/APIKEY/c\APIKEY='+$APIKEY shell2FA
sed -i '/CHATID/c\CHATID='+$CHATID shell2FA

echo "Moving and making executable"
mv shell2FA /bin/
chmod +x /bin/shell2FA

echo "Adding shell to /etc/shells"
echo "/bin/shell2FA" >> /etc/shells

echo "Done! Run following commands to add a user:"
echo "curl -fsSL https://raw.githubusercontent.com/bensofficial/2FA-SSH-Shell/master/add-user.sh -o add-user.sh"
echo "bash add-user.sh"
