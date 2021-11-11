module "my_vpc" {

  source = "/home/krishan_kumar/terra/modules/vpc"

}

module "my_instance" {

  source = "/home/krishan_kumar/terra/modules/compute"


}

module "my_dataset" {

  source = "/home/krishan_kumar/terra/modules/bigquery"

}


