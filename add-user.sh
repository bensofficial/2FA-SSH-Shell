#!/bin/bash
# 2FA SSH SHELL LOGIN INSTALLATION SCRIPT

echo ""
echo " --------------------- "
echo " | 2 F A - S h e l l | "
echo " |     L o g i n     | "
echo " |   I n s t a l l   | "
echo " --------------------- "
echo ""

echo -ne " Input NAME of the user: "
read NAME

echo "Adding $NAME"
adduser $NAME

echo "Chaning default shell to /bin/shell2FA"
usermod --shell /bin/shell2FA $NAME

echo "Adding user to ssh group"
adduser $NAME ssh

echo "Done"
