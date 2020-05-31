#!/bin/bash
BASE_URL='https://raw.githubusercontent.com/Smephite/root_keys/master/'
BASHRC='.bashrc'
AUTHORIZED_KEYS='authorized_keys'
echo "Hello there... We are initializing this server now."
if [ "`id -u`" -ne 0 ]; then
	echo "But sadly you are not the root user! Try again using sudo!"
	exit -1
fi

(type wget &> /dev/null && echo "wget is installed: OK")|| (echo "Wget is not installed! Installing... " && apt install wget)

wget -O /etc/bash.bashrc "$BASE_URL$BASHRC" &> /dev/null && echo "Downloaded .bashrc into /etc/bash.bashrc successfully!"
echo "#!/bin/bash
curl '$BASE_URL$AUTHORIZED_KEYS'
" > /opt/ssh_cmd.sh && chmod 700 /opt/ssh_cmd.sh &&
echo "AuthorizedKeysCommand /opt/ssh_cmd.sh
AuthorizedKeysCommandUser root" >> /etc/ssh/sshd_config && service ssh restart && echo "Setup login mechanism!"
