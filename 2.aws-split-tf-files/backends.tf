terraform {
  backend "s3" {
        bucket = "thisisforterraform"
        key = "amatdeploydev"
        region = "us-west-2"
        dynamodb_table = "thisisforteraform"
    
  }
}