# Terraform AWS Classic Load Balancer Variables
# Place holder file for CLB Variables
variable "http_target_group" {
  description = "Default http port of the target group"
  type = number
  default = 80
}




locals {
    # App1 Target Group - targets
    app1_tg = { for idx, item in module.ec2_private_app1.id:

        # Create a map similar to the target group map below:
        format("app1_vm%s", idx) => {

            target_id = item
            port      = var.http_target_group

        }

    }

    # App2 Target Group - targets
    app2_tg = { for idx, item in module.ec2_private_app2.id:

        # Create a map similar to the target group map below:
        format("app2_vm%s", idx) => {

            target_id = item
            port      = var.http_target_group

        }

    }

}
