class Dobro::Engine < Rails::Engine
  engine_name :dobro

  isolate_namespace ::Dobro

  paths['app/controllers'] << 'app/controllers'
  paths['app/views']       << 'app/views'
end
