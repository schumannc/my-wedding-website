
PagSeguro.configure do |config|
  #config.token       =  #sandbox
  config.token = #produção
  config.email       =
  config.environment = :production # ou :sandbox. O padrão é production.
  config.encoding    = "UTF-8" # ou ISO-8859-1. O padrão é UTF-8.
end
