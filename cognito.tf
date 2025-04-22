resource "aws_cognito_user_pool" "grupo35_video_auth_user_pool" {
  name = "grupo35_video_auth_user_pool"

  password_policy {
    minimum_length          = 8
    require_lowercase       = true
    require_numbers         = true
    require_symbols         = true
    require_uppercase       = true
    temporary_password_validity_days = 7
  }

  username_attributes = ["email"]
  

  auto_verified_attributes = ["email"]

  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }
}

resource "aws_cognito_user_pool_client" "grupo35_video_auth_user_pool_client" {
  name         = "grupo35_video_auth_user_pool_client"
  user_pool_id = aws_cognito_user_pool.grupo35_video_auth_user_pool.id
  allowed_oauth_flows = ["code"]
  allowed_oauth_scopes = ["openid", "profile", "email","aws.cognito.signin.user.admin"]

  callback_urls        = ["https://example.com/callback"]
  logout_urls          = ["https://example.com/logout"]
  explicit_auth_flows = [
    "ALLOW_USER_AUTH",
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
  ]

  read_attributes      = ["email"]
  write_attributes     = ["email"]
  
  supported_identity_providers = ["COGNITO"]
  
  refresh_token_validity = 5 # em dias
  access_token_validity  = 60 # em minutos
  id_token_validity    = 60 # em minutos

  token_validity_units {
    refresh_token = "days"
    access_token  = "minutes"
    id_token      = "minutes"
  }

  auth_session_validity = 3
}

resource "aws_cognito_user_pool_domain" "grupo35-video-auth-user-pool-domain" {
  domain       = "grupo35-video-auth" # Escolha um nome de domínio único
  user_pool_id = aws_cognito_user_pool.grupo35_video_auth_user_pool.id
}

resource "aws_cognito_user_pool_ui_customization" "default" {
  user_pool_id = aws_cognito_user_pool.grupo35_video_auth_user_pool.id
  client_id   = "ALL"
  css         = "" # CSS vazio para usar o padrão
}

output "user_pool_id" {
  value = aws_cognito_user_pool.grupo35_video_auth_user_pool.id
}

output "user_pool_client_id" {
  value = aws_cognito_user_pool_client.grupo35_video_auth_user_pool_client.id
}

output "cognito_domain" {
  value = aws_cognito_user_pool_domain.grupo35-video-auth-user-pool-domain.domain
}