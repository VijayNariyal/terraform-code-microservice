resource "azurerm_resource_group" "rg_name" {
  name     = "TF-RG"
  location = "Central India"
}

resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
    name                = "myAKSCluster"
    location            = azurerm_resource_group.rg_name.location
    resource_group_name = azurerm_resource_group.rg_name.name
    dns_prefix          = "myprefix"
    
    default_node_pool {
        name       = "default"
        node_count = 1
        vm_size    = "Standard_B2s_v2"
    }
    
    identity {
        type = "SystemAssigned"
    }
  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
  }
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.kubernetes_cluster.kube_config_raw

  sensitive = true
}
