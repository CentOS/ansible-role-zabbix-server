## Ansible Role: zabbix-server
This zabbix-server role is used in the CentOS Infra.

It surely depends (see dependencies below) on some other roles.

See also [ansible-infra-playbooks](https://github.com/CentOS/ansible-infra-playbooks) directory to see how the tree/structure is organized

### Variables
See [defaults variables and explanations](defaults/main.yml)

### Dependencies
This role can depend on some other roles, either statically defined, or dynamically included/imported:
  * See [meta/main.yml](meta/main.yml)
  * Or each <task>.yml under tasks folder for included/imported roles

All those roles are declared in our [requirements.yml](https://github.com/CentOS/ansible-infra-playbooks/blob/master/requirements-production.yml) file.

### License
MIT (see [LICENSE](LICENSE) file)

