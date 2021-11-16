apt-get update
apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt install -y docker-ce docker-compose net-tools
git clone https://github.com/dogasantos/socksproxy-composer.git
iptables -F
iptables -I INPUT -s 10.1.96.0/28 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 2081 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j DROP
iptables -A INPUT -p tcp --dport 2081 -m state --state NEW -j DROP
cd socksproxy-composer
docker-compose up -d
