output "machine_names" {
    value = vagrant_vm.Bibind[0].machine_names
}

output "host_port" {
    value = vagrant_vm.Bibind[0].ssh_config[0].port
}




output "rancher_hosts" {
    value = [
        local.rancher01_value,
        local.rancher02_value,
        local.rancher03_value
    ]
}




