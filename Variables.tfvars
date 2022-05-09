subnet_prefix = [{cidr_block = "10.0.0.0/24", name = "Public Subnet 1" },
                 {cidr_block = "10.0.1.0/24", name = "Public Subnet 2" },
                 {cidr_block = "10.0.2.0/24", name = "Private Subnet 1 | App Tier" },
                 {cidr_block = "10.0.3.0/24", name = "Private Subnet 2 | App Tier" },
                 {cidr_block = "10.0.4.0/24", name = "Private Subnet 3 | Database Tier" },
                 {cidr_block = "10.0.5.0/24", name = "Private Subnet 4 | Database Tier" } ]

aws_avz = {us-east-1a, us-east-1b} #US-East-1A for active use, US-East-1B for fault tolerence and high avaialabilty

user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'echo your very first web server > /var/www/html/index.html'
                EOF