# Terraform AWS Classic Load Balancer Variables
# Place holder file for CLB Variables
variable "http_target_group" {
  description = "Default http port of the target group"
  type = number
  default = 80
}




locals {

    tg_vms = { for idx, item in module.ec2_private.id:


        # Create a map similar to the target group map below:
        format("target_vm%s", idx) => {

            target_id = item
            port      = var.http_target_group

        }

        # Target group map
        /* 
        targets = {
            app_vm1 = {
                target_id = module.ec2_private.id[0]
                port      = var.http_target_group
            },
            app_vm2 = {
                target_id = module.ec2_private.id[1]
                port      = var.http_target_group
            }
        }
        */

    }

}
