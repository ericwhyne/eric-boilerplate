ProdServer = ""
DevServer = ""
VMIP = ""
ServerUser = "ubuntu"
privateKey= "~/.ssh/id_rsa"

# Installs everything onto a bare ubuntu server
devinstall:
	ansible-playbook -i $(DevServer), -u $(ServerUser) --private-key $(privateKey) --tags "install" -e @ansible/host_vars/dev.yml ansible/playbooks/main.yml

# Just uploads the application and restarts services
devdeploy:
	ansible-playbook -i $(DevServer), -u $(ServerUser) --private-key $(privateKey) --tags "deploy" -e @ansible/host_vars/dev.yml ansible/playbooks/main.yml

test:
	python tests/tests.py
