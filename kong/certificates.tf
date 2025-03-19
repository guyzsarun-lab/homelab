locals {
  batch_directory           = "${path.module}/certificates"
  subdirectories_with_files = fileset(local.batch_directory, "**")
  subdirectories            = setsubtract(flatten([for k, _ in toset(local.subdirectories_with_files) : dirname(k)]), ["."]) //remove "." which is not directory name
}

resource "kong-gateway_certificate" "certificate_sets" {
  for_each = local.subdirectories

  cert = file("${path.module}/certificates/${each.value}/cert.crt")
  key  = file("${path.module}/certificates/${each.value}/cert.key")
  snis = [
    "${each.value}"
  ]
}
