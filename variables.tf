/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "image_family" {
  description = "Source image family for the Bastion."
  default     = "centos-7"
}

variable "image_project" {
  description = "Project where the source image for the Bastion comes from"
  default     = "gce-uefi-images"
}

variable "create_instance_from_template" {
  description = "Whether to create and instance from the template or not. If false, no instance is created, but the instance template is created and usable by a MIG"
  default     = true
  type        = bool
}


variable "tags" {
  type        = list(string)
  description = "Network tags, provided as a list"
  default     = []
}

variable "labels" {
  description = "Key-value map of labels to assign to the bastion host"
  type        = map
  default     = {}
}

variable "machine_type" {
  description = "Instance type for the Bastion host"
  default     = "n1-standard-1"
}

variable "members" {
  description = "List of IAM resources to allow access to the bastion host"
  type        = list(string)
  default     = []
}

variable "name" {
  description = "Name of the Bastion instance"
  default     = "bastion-vm"
}

variable "network" {
  description = "Self link for the network on which the Bastion should live"
}

variable "project" {
  description = "The project ID to deploy to"
}

variable "host_project" {
  description = "The network host project ID"
  default     = ""
}

variable "region" {
  description = "The primary region where the bastion host will live"
  default     = "us-central1"
}

variable "scopes" {
  description = "List of scopes to attach to the bastion host"
  default     = ["cloud-platform"]
}

variable "service_account_roles" {
  description = "List of IAM roles to assign to the service account."
  default = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer",
    "roles/compute.osLogin",
  ]
}

variable "service_account_roles_supplemental" {
  description = "An additional list of roles to assign to the bastion if desired"
  default     = []
}

variable "service_account_name" {
  description = "Account ID for the service account"
  default     = "bastion"
}

variable "shielded_vm" {
  description = "Enable shielded VM on the bastion host (recommended)"
  default     = true
  type        = bool
}

variable "startup_script" {
  description = "Render a startup script with a template."
  default     = ""
}

variable "subnet" {
  description = "Self link for the subnet on which the Bastion should live. Can be private when using IAP"
}

variable "zone" {
  description = "The primary zone where the bastion host will live"
  default     = "us-central1-a"
}

variable "random_role_id" {
  description = "Enables role random id generation."
  type        = bool
  default     = true
}

variable "fw_name_allow_ssh_from_iap" {
  description = "Firewall rule name for allowing SSH from IAP"
  default     = "allow-ssh-from-iap-to-tunnel"
}
