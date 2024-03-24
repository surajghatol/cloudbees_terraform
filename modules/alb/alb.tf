resource "aws_alb" "alb_cb" {

  tags = {
    name = "CB_ALB"
  }
  subnets = [var.pub_subnet_az1_cb_id, var.pub_subnet_az2_cb_id]
  
}

resource "aws_instance" "ec2_instance_az1" {
  instance_type = "t2.micro"
  ami = "ami-0cd59ecaf368e5ccf"
  subnet_id = var.pub_subnet_az1_cb_id
  tags = {
    name = "ec2_az1"
  }
}

resource "aws_instance" "ec2_instance_az2" {
  instance_type = "t2.micro"
  ami = "ami-0cd59ecaf368e5ccf"
  subnet_id = var.pub_subnet_az2_cb_id
  tags = {
    name = "ec2_az2"
  }
}

resource "aws_db_subnet_group" "db_instance_group" {
  name = "db_subnet_group"
  subnet_ids = [var.priv_subnet_az1_cb_id, var.priv_subnet_az2_cb_id]

  tags = {
    Name = "db_instance_group_cb"
  }
}

resource "aws_db_instance" "db_instance" {
  allocated_storage = 20
  db_name = "mydb"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3.micro"
  username = "test"
  password = "test1234"
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.db_instance_group.name
}