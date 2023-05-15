resource "aws_instance" "nakama" {
    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"

    subnet_id = "${aws_subnet.nakama-subnet-public.id}"
    vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
    key_name = "${aws_key_pair.local-key-pair.id}"

    tags = {
        Name: "Nakama"
    }
}

resource "aws_key_pair" "local-key-pair" {
    key_name = "local-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}