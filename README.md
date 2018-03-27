# ftnt-sdw-training


## Initial config

- Connect to Bastion
- Change root passwd
  - If Bastion is Ubuntu 17.04
  - wget https://raw.githubusercontent.com/barbosm/ftnt-sdw-training/master/bastion_files/sources.list
  - mv sources.list /etc/apt/sources.list
  - apt update
- Run bastion_files/prepare_bastion.sh

- Connect to inet.sdw
- Run inet.sdw_files/prepare_inet.sdw.sh

- Connect to mpls.sdw
- Run mpls.sdw_files/prepare_mpls.sdw.sh

- Run prepare_hosts.sh
- Run device_files/prepare_devices.sh
- Run device_files/prepare_t1_dc01.sdw.sh
- Run device_files/prepare_web1.sdw.sh

- Update all to b73
- Run configload.sh
