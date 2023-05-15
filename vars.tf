variable "AWS_REGION" {    
    default = "us-east-1"
}
variable "AMI" {
    type = map(string)

    default = {
        # For demo purposes only, we are using ubuntu for the web1 and db1 instances
        us-east-1 = "ami-007855ac798b5175e" # Ubuntu 22.04 x86
    }
}
variable "EC2_USER" {
    default = "ubuntu"
}
variable "PUBLIC_KEY_PATH" {
    default = "~/.ssh/id_rsa.pub" # Replace this with a path to your public key
}