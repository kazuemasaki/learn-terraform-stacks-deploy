# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

# store "varset" "kazuemasaki" {
#   id       = "varset-QuUCQ6vdmQCbuocx"
#   category = "terraform"
# }

deployment "development" {
  inputs = {
    regions        = ["us-east-1"]
    role_arn       = "arn:aws:iam::047429787746:role/hcp-terraform-classmethod-sandbox-role"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "production" {
  inputs = {
    regions        = ["us-east-1", "ap-northeast-1"]
    role_arn       = "arn:aws:iam::047429787746:role/hcp-terraform-classmethod-sandbox-role"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}
