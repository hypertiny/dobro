class Dobro::Engine < Rails::Engine
  engine_name :dobro

  paths['app/assets']      << 'app/assets'
  paths['app/controllers'] << 'app/controllers'
  paths['app/views']       << 'app/views'
end
