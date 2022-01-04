/* A module to deploy a VPC with a pair of public and private subnets across two Availability zones.
It deploys an internet gateway with default route dedicated to the public subents
It also deploys a pair of NAT gateways(one per AVailability zone) which both of which default in the private subnets.
*/


resource "aws_subnet" "public" {
  count = var.create_networking_config ? length(var.public_subnet_cidrs): 0
  cidr_block = var.public_subnet_cidrs[count.index]
  vpc_id = "${var.vpc_id}"
  map_public_ip_on_launch = true
  availability_zone = count.index % 2 == 0 ? "${var.region}a" : "${var.region}b"
  /*Can potentially define different variables for different avialability zones in SystemVars and reference*/
  tags = {
    Name = "mwaa-${var.environment_name}-public-subnet-${count.index}"
    Environment = "${var.environment_name}"
    }
}

resource "aws_subnet" "private" {
  count = var.create_networking_config ? length(var.private_subnet_cidrs): 0
  cidr_block = var.private_subnet_cidrs[count.index]
  vpc_id = var.vpc_id
  map_public_ip_on_launch = false
  availability_zone = count.index % 2 == 0 ? "${var.region}a" : "${var.region}b"
  tags = {
    Name = "mwaa-${var.environment_name}-private-subnet-${count.index}"
    Environment = "${var.environment_name}"
    }
}

resource "aws_eip" "this" {
  count = var.create_networking_config ? length(var.public_subnet_cidrs): 0
  vpc = true
  tags = merge({
    Name = "mwaa-${var.environment_name}-eip-${count.index}"
  }, var.tags)
}

resource "aws_nat_gateway" "this" {
  count = 1         /*Specifies the number of resource instances to be created*/
  allocation_id = aws_eip.this[count.index].id
  subnet_id = aws_subnet.public[count.index].id
  tags = merge({
    Name = "mwaa-${var.environment_name}-nat-gateway-${count.index}"
  }, var.tags)
}

resource "aws_route_table" "public" {
  /*Specifies the number of resource instances to be created 2 in this case*/
  count = var.create_networking_config ? length(var.public_subnet_cidrs): 0 
  vpc_id = "${var.vpc_id}"
  route {
    cidr_block = var.route_table_pub_cidr
    gateway_id = "${var.internet_gateway_id}"
  }
  tags = merge({
    Name = "mwaa-${var.environment_name}-public-routes"
  }, var.tags)
}

resource "aws_route_table_association" "public" {
  count = var.create_networking_config ? length(aws_subnet.public): 0
  route_table_id = aws_route_table.public[0].id
  subnet_id = aws_subnet.public[count.index].id
}

resource "aws_route_table" "private" {
  count = length(aws_nat_gateway.this)
  vpc_id = "${var.vpc_id}"
  route {
    cidr_block = var.route_table_priv_cidr
    nat_gateway_id = aws_nat_gateway.this[count.index].id
  }
  tags = {
    Name = "mwaa-${var.environment_name}-private-routes"
    Environment = "${var.environment_name}"
  }
}

resource "aws_route_table_association" "private" {
  /*Specifies the number of resource instances to be created as many as there are nat gateways*/
  count = length(aws_nat_gateway.this)    
  route_table_id = aws_route_table.private[count.index].id
  subnet_id = aws_subnet.private[0].id # aws_subnet.private[count.index].id
}

resource "aws_security_group" "this" {
  vpc_id = "${var.vpc_id}"
  name = "mwaa-${var.environment_name}-no-ingress-sg"
  tags = merge({
    Name = "mwaa-${var.environment_name}-no-ingress-sg"
  }, var.tags  )

  # Allow all inbound traffic NOT SECURE
  ingress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    
  }
  # Allow all outbound traffic
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}