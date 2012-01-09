ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "ernanesena.com.br",
  :user_name            => "noreplay@ernanesena.com.br",
  :password             => "cliente2011",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
