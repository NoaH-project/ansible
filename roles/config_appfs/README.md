config_appfs
=========

Role para detecção e configuração de block device com Volume Manager e filesystem BTRFS.

Em versões posteriores pretende-se disponibilizar outras opções de filesystems a serem informadas pelo Playbook.

Requirements
------------

Em ambientes Debian GNU/Linux 9 (Stretch) ou 10 (Buster) o pacote btrfs-progs deve estar instalado. Em caso contrário ele será automaticamente instalado por esta role.

Role Variables
--------------

- vars/main.yml ou no Playbook (preferencialmente):
```YAML
---
- vars:
    uninstall: false
    FSs:
      - {name: 'foo', path: '/bar'}
      - {name: 'bar', path: '/foo/bar'}
...      
```
Caso a variável 'uninstall' seja iniciada com o valor 'true', as tasks de
desinstalação serão executadas e as de instalação puladas.

Dependencies
------------

- python >= 2.7
- ansible >= 2.9

Example Playbook
----------------

Um exemplo de Playbooks pode ser encontrado na pasta ./tests.

Arquivos:
  - test.yml (Playbook)
  - inventory (Inventário)

Playbook (test.yml):
```YAML
---
- hosts: test
  roles:
    - config_appfs
  vars:
    uninstall: false
    FSs:
      - {name: 'foo', path: '/bar'}
      - {name: 'bar', path: '/foo/bar'}
```
Inventário (hosts.yml):
```YAML
---
all:
  children:
    test:
      hosts:
        172.16.41.130:
        172.16.41.131:
        172.16.41.132:
...
```

License
-------

MIT

Author Information
------------------

Clauzio Cristiano Perpétuo - clauzio.perpetuo@gmail.com
