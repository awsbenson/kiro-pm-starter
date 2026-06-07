output "pm_environments" {
  description = "Access details for each PM environment"
  value = [
    for i in range(var.pm_count) : {
      name     = var.pm_names[i]
      url      = "https://${aws_instance.kiro_ide[i].public_ip}:8443"
      username = var.pm_names[i]
      password = random_password.pm_passwords[i].result
    }
  ]
  sensitive = true
}

output "pm_urls" {
  description = "Quick access URLs for each PM"
  value = {
    for i in range(var.pm_count) :
    var.pm_names[i] => "https://${aws_instance.kiro_ide[i].public_ip}:8443"
  }
}

output "pm_credentials" {
  description = "Login credentials for each PM (username/password)"
  value = {
    for i in range(var.pm_count) :
    var.pm_names[i] => {
      username = var.pm_names[i]
      password = random_password.pm_passwords[i].result
    }
  }
  sensitive = true
}
