locals {
  product_information = {
    context : {
      project    = "average"
      layer      = "infrastructure"
      service    = "client"
      start_date = "2022-09-28"
      end_date   = "unknown"
    }
    purpose : {
      disaster_recovery = "medium"
      service_class     = "bronze"
    }
    organization : {
      client = "average"
    }
    stakeholders : {
      business_owner  = "xavier.norris"
      technical_owner = "romain.cambonie@gmail.com"
      approver        = "romain.cambonie@gmail.com"
      creator         = "terraform"
      team            = "average"
    }
  }
}

locals {
  projectTitle = title(replace(local.product_information.context.project, "_", " "))
  layerTitle   = title(replace(local.product_information.context.layer, "_", " "))
  serviceTitle = title(replace(local.product_information.context.service, "_", " "))
}
