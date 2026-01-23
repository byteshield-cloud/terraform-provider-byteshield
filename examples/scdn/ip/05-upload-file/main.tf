terraform {
  required_providers {
    byteshield = {
      source  = "byteshield-cloud/byteshield"
      version = "~> 1.0"
    }
  }
}

provider "byteshield" {
  access_key = var.access_key
  secret_key = var.secret_key
  endpoint   = var.endpoint
}

variable "access_key" {
  description = "Byteshield Access Key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Byteshield Secret Key"
  type        = string
  sensitive   = true
}

variable "endpoint" {
  description = "Byteshield SCDN API Endpoint"
  type        = string
  default     = "https://apiv4.lalcsafe.com/"
}

resource "byteshield_scdn_user_ip" "file_upload_demo" {
  name      = "terraform-file-upload-demo"
  remark    = "IP list created via file upload from Terraform"
  file_path = "${path.module}/ip_list.txt"
}

output "user_ip_id" {
  value = byteshield_scdn_user_ip.file_upload_demo.id
}
