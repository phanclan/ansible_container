# ansible_container

https://medium.com/@iced_burn/run-ansible-with-docker-9eb27d75285b


#==> Build Docker Image
docker build --tag peterphan/ansible:latest . &


#==> alpine
```shell
docker run -v "${PWD}":/ansible/playbooks:ro \
  -v ~/.ssh:/root/.ssh:ro --rm \
  peterphan/ansible_container:latest ansible-playbook playbook.yml -i hosts
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

multipass launch --name server-a-1 -c 1 -m 1536M -d 5G --cloud-init cloud-init.yaml
multipass launch --name client-a-1 -c 1 -m 1024M -d 5G --cloud-init cloud-init.yaml