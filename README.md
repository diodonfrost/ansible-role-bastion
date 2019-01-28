# ansible-role-bastion

[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.bastion-660198.svg)](https://galaxy.ansible.com/diodonfrost/bastion)
[![Build Status](https://travis-ci.org/diodonfrost/ansible-role-bastion.svg?branch=master)](https://travis-ci.org/diodonfrost/ansible-role-bastion)


This role provide a compliance for install bastion on your target host.

## Requirements

This role was developed using Ansible 2.7 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.bastion` to install the role on your system.

Supported platforms:

```yaml
- name: EL
  versions:
    - 7
    - 6
    - 5
- name: Fedora
  versions:
    - 29
    - 28
    - 27
    - 26
- name: Debian
  versions:
    - stretch
    - jessie
    - wheezy
    - squeeze
- name: Ubuntu
  versions:
    - bionic
    - xenial
    - trusty
    - precise
    - trusty
- name: OracleLinux
  versions:
    - 7
    - 6
- name: Amazon
  versions:
    - 2017.12
    - 2016.03
    - 2013.09
- name: opensuse
  versions:
    - 13.2
    - 42.1
    - 42.2
    - 42.3
- name: SLES
  versions:
    - 11
    - 12
    - 15
- name: ArchLinux
  versions:
    - any
- name: Gentoo
  versions:
    - stage3
```

## Dependencies

None

## Example Playbook

This is a sample playbook file for deploying the Ansible Galaxy bastion role in a localhost.

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: diodonfrost.bastion
```

## Local Testing

The preferred way of locally testing the role is to use Docker. You will have to install Docker on your system.

You can also use vagrant and Virtualbox with vagrant to run tests locally. You will have to install Virtualbox and Vagrant on your system. For all our tests we use test-kitchen.

Next install test-kitchen:

```shell
# Install dependencies
gem install bundler
bundle install
```

### Testing with Docker

```shell
# List all tests with kitchen
kitchen list

# fast test on one machine
kitchen test default-centos-7

# test on all machines
kitchen test

# for development, create environment
kitchen create default-centos-7

# Apply ansible playbook
kitchen converge default-centos-7

# Apply inspec tests
kitchen verify default-centos-7
```

### Testing with Virtualbox

```shell
# Specify kitchen file on Linux
export KITCHEN_YAML=.kitchen-vagrant.yml

# fast test on one machine
kitchen test default-centos-7
```

## License

Apache 2

## Resources

[bastion on aws](https://docs.aws.amazon.com/quickstart/latest/linux-bastion/architecture.html)

## Author Information

This role was created in 2019 by diodonfrost.
