resource "vagrant_vm" "Bibind" {
  count = 1
}


locals {
  # Vagrant-specific
  rancher01_index = index(vagrant_vm.Bibind[0].machine_names, "rancher01")
  rancher02_index   = index(vagrant_vm.Bibind[0].machine_names, "rancher02")
  rancher03_index = index(vagrant_vm.Bibind[0].machine_names, "rancher03")

#  master_index = index(vagrant_vm.Bibind[0].machine_names, "master")
#  worker1_index   = index(vagrant_vm.Bibind[0].machine_names, "worker1")
#  worker2_index = index(vagrant_vm.Bibind[0].machine_names, "worker2")


  # Settings for accessing the three Bibind created by Azure or Vagrant
  rancher01_user         = vagrant_vm.Bibind[0].ssh_config[local.rancher01_index].user
  rancher01_private_key  = vagrant_vm.Bibind[0].ssh_config[local.rancher01_index].private_key
  rancher01_port         = vagrant_vm.Bibind[0].ssh_config[local.rancher01_index].port
  rancher01_host         = vagrant_vm.Bibind[0].ssh_config[local.rancher01_index].host

  rancher01_value = [
    {
      "name" : "rancher01",
      "group": "rke_cluster_rancher ",
      "private_key" : local.rancher01_private_key,
      "port" : local.rancher01_port,
      "ansible_user" : local.rancher01_user,
      "hostname" : "192.168.56.4"
    }]

  rancher02_user         = vagrant_vm.Bibind[0].ssh_config[local.rancher02_index].user
  rancher02_private_key  = vagrant_vm.Bibind[0].ssh_config[local.rancher02_index].private_key
  rancher02_port         = vagrant_vm.Bibind[0].ssh_config[local.rancher02_index].port
  rancher02_host         = vagrant_vm.Bibind[0].ssh_config[local.rancher02_index].host

  rancher02_value = [
    {
      "name" : "rancher02",
      "group": "rke_cluster_rancher ",
      "private_key" : local.rancher02_private_key,
      "port" : local.rancher02_port,
      "ansible_user" : local.rancher02_user,
      "hostname" : "192.168.56.5"
    }]

  rancher03_user         = vagrant_vm.Bibind[0].ssh_config[local.rancher03_index].user
  rancher03_private_key  = vagrant_vm.Bibind[0].ssh_config[local.rancher03_index].private_key
  rancher03_port         = vagrant_vm.Bibind[0].ssh_config[local.rancher03_index].port
  rancher03_host         = vagrant_vm.Bibind[0].ssh_config[local.rancher03_index].host

  rancher03_value = [
    {
      "name" : "rancher03",
      "group": "rke_cluster_rancher ",
      "private_key" : local.rancher03_private_key,
      "port" : local.rancher03_port,
      "ansible_user" : local.rancher03_user,
      "hostname" : "192.168.56.6"
    }]

#  master_user         = vagrant_vm.Bibind[0].ssh_config[local.master_index].user
#  master_private_key  = vagrant_vm.Bibind[0].ssh_config[local.master_index].private_key
#  master_port         = vagrant_vm.Bibind[0].ssh_config[local.master_index].port
#  master_host         = vagrant_vm.Bibind[0].ssh_config[local.master_index].host
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
#  worker1_user         = vagrant_vm.Bibind[0].ssh_config[local.worker1_index].user
#  worker1_private_key  = vagrant_vm.Bibind[0].ssh_config[local.worker1_index].private_key
#  worker1_port         = vagrant_vm.Bibind[0].ssh_config[local.worker1_index].port
#  worker1_host         = vagrant_vm.Bibind[0].ssh_config[local.worker1_index].host
#  worker1_private_host = local.worker1_host
#
#  worker1_value = [
#    {
#      "name" : "worker1",
#      "private_key" : local.worker1_private_key,
#      "port" : local.worker1_port,
#      "ansible_user" : local.worker1_user,
#      "hostname" : local.worker1_host
#    }
#
#  ]
#
#  worker2_user         = vagrant_vm.Bibind[0].ssh_config[local.worker2_index].user
#  worker2_private_key  = vagrant_vm.Bibind[0].ssh_config[local.worker2_index].private_key
#  worker2_port         = vagrant_vm.Bibind[0].ssh_config[local.worker2_index].port
#  worker2_host         = vagrant_vm.Bibind[0].ssh_config[local.worker2_index].host
#  worker2_private_host = local.worker2_host


}
