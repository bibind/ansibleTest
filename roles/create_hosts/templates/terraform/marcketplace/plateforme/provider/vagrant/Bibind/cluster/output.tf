output "machine_names" {
    value = vagrant_vm.plateforme[0].machine_names
}

output "host_port" {
    value = vagrant_vm.plateforme[0].ssh_config[0].port
}




output "cluster_hosts" {
    value = [
        local.master_value,
        local.worker01_value,
        local.worker02_value
    ]
}




