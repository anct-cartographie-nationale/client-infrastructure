data "aws_caller_identity" "current_iam" {}

locals {
  tags = {
    context-project                   = local.product_information.context.project
    context-layer                     = local.product_information.context.layer
    context-service                   = local.product_information.context.service
    context-start_date                = local.product_information.context.start_date
    context-end_date                  = local.product_information.context.end_date
    purpose-environment               = terraform.workspace
    purpose-disaster_recovery         = local.product_information.purpose.disaster_recovery
    purpose-service_class             = local.product_information.purpose.service_class
    organization-client               = local.product_information.organization.client
    stakeholders-business_owner       = local.product_information.stakeholders.business_owner
    stakeholders-technical_owner      = local.product_information.stakeholders.technical_owner
    stakeholders-approver             = local.product_information.stakeholders.approver
    stakeholders-creator              = local.product_information.stakeholders.creator
    stakeholders-team                 = local.product_information.stakeholders.team
    stakeholders-deployer_iam_account = data.aws_caller_identity.current_iam.account_id
  }
}
