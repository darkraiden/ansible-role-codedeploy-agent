# Codedeploy Agent

[![Build Status](https://travis-ci.org/darkraiden/ansible-role-codedeploy-agent.svg?branch=master)](https://travis-ci.org/darkraiden/ansible-role-codedeploy-agent)

Ansible Role to provision the AWS Codedeploy Agent.

## Requirements

N/A

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml` and `vars/`):

### Defaults

```yml
codedeploy_agent_s3_download_bucket_name: ""
codedeploy_agent_version: latest
```

The Codedeploy Agent version and its bucket name; usually the format of the latter is `aws-codedeploy-your-region` (e.g. `aws-codedeploy-eu-west-1`). More info can be found [here](https://docs.aws.amazon.com/codedeploy/latest/userguide/resource-kit.html#resource-kit-bucket-names).

### Vars

```yml
codedeploy_agent_packages:
  - git
  - wget
  - ruby
```

Codedeploy Agent dependencies to be installed

```yml
codedeploy_agent_s3_download_url: https://{{ codedeploy_agent_s3_download_bucket_name }}.s3.amazonaws.com/{{ codedeploy_agent_version }}/install
```

Codedeploy Agent S3 download URL.

## Dependencies

N/A

## Handlers

The role comes with the following handlers:

*   restart the codedeploy agent - It restarts the `codedeploy-agent` service.

## Test Kitchen

The role can be tested using test kitchen. Make sure the following packages are installed:

*   ruby 2.x
*   docker
*   gems:
    *   test-kitchen
    *   kitchen-docker
    *   kitchen-ansible

```bash
$ kitchen test
```

This command will create the machines, converge and test the role and finally destroy them.

### Write your tests

You can write your own test by adding a new file or editing the existing one living in the `test/integration/codedeploy-agent/serverspec/localhost` directory. More info about how to write serverspec test can be found [here](http://serverspec.org/).

## Example Playbook

```yml
- hosts: servers
  roles:
      - { role: darkraiden.ansible-codedeploy-agent }
```

## License

MIT

## Author Information

This role was created in 2018 by [Davide Di Mauro](https://github.com/darkraiden).
