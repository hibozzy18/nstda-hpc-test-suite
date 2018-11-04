# nstda-hpc-test-suite (ThaiSC)
All in One repo, docker-compose style local development environment, ansible based integration deploy/tests.
### Principal Designs
- `Single source of truth` about `Hosts & Topology` info (inventory): Imitate real production topology as much as we can
                                                                  to reduce error at runtime.
- Stick with `Conatainerized Technology`: for convenient while developing both deploy/testing script in automated fashion.
                                         easily to redeploy all.
- Encourage `Test Drivent Development(TDD)`: to simplify & automated `test` & `implement` loop as code over ThaiSC 
                                           Slurm-HPC cluster deployment.

### Prerequisite
- Docker for Mac / Docker for Windows: [Official site](https://www.docker.com/products/docker-desktop)
- Git: follow Installation guide from [bitbucket tutorial](https://www.atlassian.com/git/tutorials/install-git) or [main site](https://git-scm.com/downloads)
- Ansible: Install via pip from [Official site](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-pip)
### Usage (Exploration & Investigation mode)
- Clone this repository to your machine, export path for availability of `thaisc` command
  ```
  git clone https://github.com/sinonkt/nstda-hpc-test-suite.git
  cd nstda-hpc-test-suite
  echo "export PATH=$HOME/nstda-hpc-test-suite/bin:$PATH" >> ~/.bash_profile
  ```
- Create cluster from exsiting inventory(default=local) & code. (all inventory available stay inside `inventories/*` 
  ```
  thaisc up               # you can specify which inventory by `thaisc -i stagging up`
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

### Contact
  - Krittin Phornsiricharoenphant, oatkrittin@gmail.com
