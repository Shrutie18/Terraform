resource "aws_db_instance" "this_rds" {
  allocated_storage    = var.this_list[0]                
  engine               = var.this_db_engine               
  engine_version       = var.this_engine_version                     
  instance_class       = var.this_instance_class           
  db_name              = var.this_db_name           
  username             = var.this_username                   
  password             = var.this_pass              
  parameter_group_name = var.this_list[7]        
  skip_final_snapshot  = var.this_list[8]                     
  publicly_accessible  = var.this_list[9]                      
  vpc_security_group_ids = [var.this_list[10]]  
  multi_az             = var.this_list[11]                     
}