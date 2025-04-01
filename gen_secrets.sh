mkdir -p secrets
openssl rand -base64 32 > ./secrets/auth_password.txt
echo "authadmin" > ./secrets/auth_user.txt
openssl rand -base64 32 > ./secrets/bills_password.txt
echo "billsadmin" > ./secrets/bills_user.txt
openssl rand -base64 32 > ./secrets/chores_password.txt
echo "choresadmin" > ./secrets/chores_user.txt
openssl rand -base64 32 > ./secrets/chat_password.txt
echo "chatadmin" > ./secrets/chat_user.txt
openssl rand -base64 32 > ./secrets/notifications_password.txt
echo "notificationsadmin" > ./secrets/notifications_user.txt
openssl rand -base64 32 > ./secrets/users_password.txt
echo "usersadmin" > ./secrets/users_user.txt
