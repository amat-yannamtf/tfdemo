output "webserverip" {
  value = "${azurerm_public_ip.web.ip_address}"
}

output "web1subnetid" {
  value = "${data.azurerm_subnet.mysubnetquery.id}"
}

output "web1addressprefix" {
  value = "${data.azurerm_subnet.mysubnetquery.address_prefix}"
}




