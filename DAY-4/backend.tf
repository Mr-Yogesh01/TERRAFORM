terraform {
  backend "s3" {
    bucket = "yoghesh.xyz"
    key    = "Day-4/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true #s3 supports this feature but teraaform version > 1.10, latest version >=1.10

  }
}