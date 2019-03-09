function message {
echo "[tvs-m] message:"  $1 ; }



function list {
echo '[list]' $1  ; }

function quest {
echo '[question]:' $1
read ban
case $ban in
y)
echo
;;
*)
message 'отменено пользователем'
exit 0
;;
esac
}

quest 'Записать скрипт? (y/n)'
message 'Запись скрипта запуска...'
odin='$1'
cat >/data/data/com.termux/files/usr/bin/bb<<-EOM
function message {
echo "[tvs-m] message:"  $odin ; }

clear
clear
clear
toilet Back --gay
toilet Box --gay
message 'startscript by Valerik 228 4pda'
if export PROOT_NO_SECCOMP=1;
then echo '[OK] fixmandb_android8.0';
else echo '[ERROR] fix_mandb_android8.0';
fi
message 'запуск sshd...'
if sshd;
then echo '[OK] sshd(1)';
else echo '[ERROR] sshd(1)';
fi
message 'Запуск debian...'
if ~/start-backbox.sh;
then echo;
else echo '[ERROR] debian(main)';
fi

EOM

chmod +x /data/data/com.termux/files/usr/bin/deb

message ' writing helpscript... ' 
cat >/data/data/com.termux/files/usr/bin/fshelp<<-EOM
clear
toilet fstart --gay
toilet v2e
echo by Valerik_228/tvsclass
echo
echo Usage:
echo bb - start backbox


EOM

chmod +x /data/data/com.termux/files/usr/bin/fshelp

echo writing cfgscript... && cat >/data/data/com.termux/files/usr/bin/fscfg<<-EOM
apt install toilet

EOM

chmod +x /data/data/com.termux/files/usr/bin/fscfg

fscfg

cd ~/backbox-fs/root/
git clone https://github.com/tvsclass/tvsgui8
