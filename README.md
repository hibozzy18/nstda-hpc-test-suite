# nstda-hpc-test-suite (ThaiSC)
All in One repo, docker-compose style local development environment, ansible based integration deploy/tests.
### Design Principles 
- <b>Single source of truth</b> about <b>Hosts & Topology</b> info (inventory): Imitate real production topology as much as we can
                                                                  to reduce error at runtime.
- Stick with <b>Conatainerized Technology</b>: for convenient while developing both deploy/testing script in automated fashion.
                                         easily to redeploy all.
- Encourage <b>Test Drivent Development(TDD)</b>: to simplify & automated `test` & `implement` loop as code over ThaiSC 
                                           Slurm-HPC cluster deployment.

### Prerequisite
- Docker for Mac / Docker for Windows: [Official site](https://www.docker.com/products/docker-desktop)
- Git: follow Installation guide from [bitbucket tutorial](https://www.atlassian.com/git/tutorials/install-git) or [main site](https://git-scm.com/downloads)
- Ansible: Install via pip from [Official site](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-pip)
### Usage (Developing Test & Implement Loop)
- Clone this repository to your machine, export path for availability of `thaisc` command
  ```
  git clone https://github.com/sinonkt/nstda-hpc-test-suite.git
  cd nstda-hpc-test-suite
  echo "export PATH=$HOME/nstda-hpc-test-suite/bin:$PATH" >> ~/.bash_profile
  ```
- Create cluster from exsiting inventory(default=local) & code. (all inventory available stay inside `inventories/*` 
  ```
  thaisc up               # you can specify which inventory by `thaisc -e stagging -i ansible up`
  ```
- Then Every single node in cluster was spawned as container. we can exec into `admin` node where have `ansible` installed & this project codes inside this container.
  ```
  thaisc admin
  ```
- (admin)> Now that you are inside admin node container you can do something like.
  ```
  ansbile@admin$> thaisc implement        # to run implement ansible play for implementation team.
  ```
  ```
  ansbile@admin$> thaisc test        # to run test ansible play for tests team. 
  ```
- when you are done with your developing test-script/deploy-script. Just Ctrl+C
  and when you are failed to stop containers. you can run clean cmd.
  (Caution!) actually this clean cmd run set of docker cmd to clean containers.
             It may prune all other existing/running project network/container/images
             to get a clean environment
  ```
  thaisc clean
  ```
- get usage
  ```
  thaisc --help
  ```
```
thaisc [-h|--help] [-e|--environment -i|--implement play] -- thaisc deploy/test suite, ansible-playbook command wrapper
most of time, we run implement/test play inside admin container. and for generate/up/build/clean/admin run on host machine.
this script was created from my frequently used cmd. (Krittin Phornsiricharoenphant, oatkrittin@gmail.com)
(Required: ansible)

where:
    -h, --help        show usage info.
    -e, --environment inventory to run at, which available in inventories/* dir. (default=local)
    -i, --implement   either docker or ansible, (default=docker)
    --save            to auto redirect test result to results/environment/*.log
    play | subcmd     playbook which available on this thaisc project.
        generate(play)  - to generate docker-compose.yml for further use while locally developing.
        implement(play) - to automate deploy, which make changes on inventory you provided.
        test(play)      - Ansible Dry-run, focus on testing only, no changes will be made from this run.
        up(subcmd)      - Generate docker-compose.yml then run docker-compose up.
        build(subcmd)   - Build all docker images needed for docker & ansible implementation.
        clean(subcmd)   - (Caution!) actually this subcmd run set of docker cmd to clean containers.
                          It may prune all other existing/running project network/container/images
                          to get a clean environment.
        admin(subcmd)   - alias for > docker exec -it admin /bin/bash
```
### Prior Arts & Source of Inspiration
 - [slurm-docker-cluster](https://github.com/giovtorres/slurm-docker-cluster)
 - [docker-slurm](https://github.com/GRomR1/docker-slurmbase)
 - [slurm-on-kubernetes](https://github.com/sinonkt/slurm-on-kubernete)(My Prior project)

### Contributors (Need update)
  - Krittin Phornsiricharoenphant, oatkrittin@gmail.com
  - Putt Sakdhnagool, putt.sakdhnagool@nectec.or.th
  
## Acknowlegdement (Need update)
ThaiSC team. 
