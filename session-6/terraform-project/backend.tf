terraform {
  backend "remote" {
    organization = "david-vasconcelos-iac-lab"

    workspaces {
      name = "iac-lab"
    }
  }
}