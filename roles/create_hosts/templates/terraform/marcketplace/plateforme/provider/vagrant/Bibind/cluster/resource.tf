resource "vagrant_vm" "plateforme" {
  count = 1
}


locals {
  # Vagrant-specific
#  rancher01_index = index(vagrant_vm.plateforme[0].machine_names, "rancher01")
#  rancher02_index   = index(vagrant_vm.plateforme[0].machine_names, "rancher02")
#  rancher03_index = index(vagrant_vm.plateforme[0].machine_names, "rancher03")

  master_index = index(vagrant_vm.plateforme[0].machine_names, "master")
  worker01_index   = index(vagrant_vm.plateforme[0].machine_names, "worker01")
  worker02_index = index(vagrant_vm.plateforme[0].machine_names, "worker02")


  # Settings for accessing the three plateforme created by Azure or Vagrant
  master_user         = vagrant_vm.plateforme[0].ssh_config[local.master_index].user
  master_private_key  = vagrant_vm.plateforme[0].ssh_config[local.master_index].private_key
  master_port         = vagrant_vm.plateforme[0].ssh_config[local.master_index].port
  master_host         = vagrant_vm.plateforme[0].ssh_config[local.master_index].host

  master_value = [
    {
      "name" : "master",
      "group": "master",
      "private_key" : local. master_private_key,
      "port" : local. master_port,
      "ansible_user" : local. master_user,
      "hostname" : "192.168.56.7"
    }]

#  rancher02_user         = vagrant_vm.plateforme[0].ssh_config[local.rancher02_index].user
#  rancher02_private_key  = vagrant_vm.plateforme[0].ssh_config[local.rancher02_index].private_key
#  rancher02_port         = vagrant_vm.plateforme[0].ssh_config[local.rancher02_index].port
#  rancher02_host         = vagrant_vm.plateforme[0].ssh_config[local.rancher02_index].host
#
#  rancher02_value = [
#    {
#      "name" : "rancher02",
#      "private_key" : local.rancher02_private_key,
#      "port" : local.rancher02_port,
#      "ansible_user" : local.rancher02_user,
#      "hostname" : local.rancher02_host
#    }]
#
#  rancher03_user         = vagrant_vm.plateforme[0].ssh_config[local.rancher03_index].user
#  rancher03_private_key  = vagrant_vm.plateforme[0].ssh_config[local.rancher03_index].private_key
#  rancher03_port         = vagrant_vm.plateforme[0].ssh_config[local.rancher03_index].port
#  rancher03_host         = vagrant_vm.plateforme[0].ssh_config[local.rancher03_index].host
#
#  rancher03_value = [
#    {
#      "name" : "rancher03",
#      "private_key" : local.rancher03_private_key,
#      "port" : local.rancher03_port,
#      "ansible_user" : local.rancher03_user,
#      "hostname" : local.rancher03_host
#    }]

#  master_user         = vagrant_vm.plateforme[0].ssh_config[local.master_index].user
#  master_private_key  = vagrant_vm.plateforme[0].ssh_config[local.master_index].private_key
#  master_port         = vagrant_vm.plateforme[0].ssh_config[local.master_index].port
#  master_host         = vagrant_vm.plateforme[0].ssh_config[local.master_index].host
#
#  master_value = [
#    {
#      "name" : "master",
#      "private_key" : local.master_private_key,
#      "port" : local.master_port,
#      "ansible_user" : local.master_user,
#      "hostname" : local.master_host
#    }
#
#  ]
#
  worker01_user         = vagrant_vm.plateforme[0].ssh_config[local.worker01_index].user
  worker01_private_key  = vagrant_vm.plateforme[0].ssh_config[local.worker01_index].private_key
  worker01_port         = vagrant_vm.plateforme[0].ssh_config[local.worker01_index].port
  worker01_host         = vagrant_vm.plateforme[0].ssh_config[local.worker01_index].host
  worker01_private_host = local.worker01_host

  worker01_value = [
    {
      "name" : "worker01",
      "group": "worker",
      "private_key" : local.worker01_private_key,
      "port" : local.worker01_port,
      "ansible_user" : local.worker01_user,
      "hostname" : "192.168.56.8"
    }

  ]

  worker02_user         = vagrant_vm.plateforme[0].ssh_config[local.worker02_index].user
  worker02_private_key  = vagrant_vm.plateforme[0].ssh_config[local.worker02_index].private_key
  worker02_port         = vagrant_vm.plateforme[0].ssh_config[local.worker02_index].port
  worker02_host         = vagrant_vm.plateforme[0].ssh_config[local.worker02_index].host
  worker02_private_host = local.worker02_host

  worker02_value = [
    {
      "name" : "worker02",
      "group" : "worker",
      "private_key" : local.worker02_private_key,
      "port" : local.worker02_port,
      "ansible_user" : local.worker02_user,
      "hostname" : "192.168.56.9"
    }

  ]
  
  
}
