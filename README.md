# ansible_container

https://medium.com/@iced_burn/run-ansible-with-docker-9eb27d75285b


#==> Build Docker Image
docker build --tag peterphan/ansible:latest . &


#==> alpine
```shell
docker run -v "${PWD}":/ansible/playbooks:ro \
  -v ~/.ssh:/root/.ssh:ro --rm \
  phanclan/ansible:latest ansible-playbook playbook.yml -i hosts
#  -v ~/.ansible/roles:/root/.ansible/roles \
```

```shell
time for i in 1 2 3; do
ssh server-a-${i} << EOF
mkdir -p /var/monkey1
mkdir -p /var/monkey2
mkdir -p /var/monkey3
chmod 777 /var/monkey1
chmod 777 /var/monkey2
chmod 777 /var/monkey3
EOF
done
```


#multipass key located here Mac:
/var/root/Library/Application\ Support/multipassd/ssh-keys/id_rsa

