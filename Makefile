requirements:
	ansible-galaxy install -r requirements.yml

gitlab-runner:
	ansible-playbook main.yml --tags 'gitlab-runner'
