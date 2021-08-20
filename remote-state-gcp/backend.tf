terraform{
  backend "gcs" {

    bucket      = "tfremotestatedemo"
    prefix      = "dev"
    credentials = "D:/novelvista-devops/terraform/credentilas//secrets.json"
  }

}
