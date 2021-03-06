export DISPLAY_SKIPPED_HOSTS := 0
export ANSIBLE_NOCOWS := 1

INVENTORIES = staging production

INVENTORY := staging
ANSIBLE_OPTIONS :=
# USER := 
# DOMAIN :=
# CMD :=
# TAGS := 

install:
	@echo Installing dependensies...
	ansible-galaxy install -r requirements.yml

provision:
	@echo Provision ${INVENTORY} configuration...
	ansible-playbook ${ANSIBLE_OPTIONS} --diff --inventory ./inventories/${INVENTORY}.ini ./playbooks/provision.yml -k -u root

$(INVENTORIES):
	$(eval INVENTORY := $@)
	@echo Forced ${INVENTORY} environment

