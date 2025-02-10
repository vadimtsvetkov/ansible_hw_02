variable "token" {
  description = "OAuth token для Yandex Cloud"
  type        = string
}

variable "cloud_id" {
  description = "ID облака в Yandex Cloud"
  type        = string
}

variable "folder_id" {
  description = "ID папки в Yandex Cloud"
  type        = string
}

variable "default_zone" {
  description = "zone в Yandex Cloud"
  type        = string
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ для доступа к VM"
  type        = string
}

variable "image_family" {
  description = "Семейство образа для создания ВМ"
  type        = string
  default     = "ubuntu-2004-lts"
}
