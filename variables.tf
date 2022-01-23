terraform {

     required_providers {
         spacelift = {
            source = "spacelift-io/spacelift"
	    version = "~> 0.1.10"
}
}
}

provider "spacelift" {

  api_key_endpoint = "https://otnihs.app.spacelift.io"
  api_key_id       = "01FT100DWZC3EQGDHG6T7AGSXV"
  api_key_secret   = "b834dcf43203c32f003042bd55b282badaf92a20b9db6903552682477230f559"
}


variable "new_stack_name" {
  type = string
  description = "Description for the stack to create."
}
