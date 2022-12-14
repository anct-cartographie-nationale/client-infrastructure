locals {
  product_information = {
    context : {
      product    = var.product
      service    = var.service
      start_date = "2022-04-01"
      end_date   = "unknown"
    }
    purpose : {
      disaster_recovery = "medium"
      service_class     = "bronze"
    }
    organization : {
      client = "anct"
    }
    stakeholders : {
      business_owner  = "celestin.leroux@beta.gouv.fr"
      technical_owner = "marc.gavanier@beta.gouv.fr"
      approver        = "marc.gavanier@beta.gouv.fr"
      creator         = "terraform"
      team            = "cartographie-nationale"
    }
  }
}

locals {
  productTitle = title(replace(local.product_information.context.product, "_", " "))
  serviceTitle = title(replace(local.product_information.context.service, "_", " "))
}
