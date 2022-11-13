terraform {
  backend "s3" {
        bucket          = "amattfstae"
        key             = "global/amattf/amattf.tfstate"
        region          = "us-west-2"
        dynamodb_table  = "amatdbfortflock"

  }
  
}
