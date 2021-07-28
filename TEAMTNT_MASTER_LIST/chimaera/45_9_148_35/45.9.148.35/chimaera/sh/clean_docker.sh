if type docker 2>/dev/null 1>/dev/null; then 
docker ps | grep "pocosow" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "gakeaws" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "azulu" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "auto" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "xmr" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "mine" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "monero" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "slowhttp" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "bash.shell" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "entrypoint.sh" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "/var/sbin/bash" | awk '{print $1}' | xargs -I % docker kill %
docker images -a | grep "pocosow" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "gakeaws" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "buster-slim" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "hello-" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "azulu" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "registry" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "xmr" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "auto" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "mine" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "monero" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "slowhttp" | awk '{print $3}' | xargs -I % docker rmi -f %
fi
