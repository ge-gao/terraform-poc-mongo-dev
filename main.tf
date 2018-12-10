# Configure the MongoDB Atlas Provider
provider "aws" {
  provisioner "local-exec" {
    command = "echo $HOME"
  }
}
