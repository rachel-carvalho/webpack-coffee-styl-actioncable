ActiveSupport.on_load(:action_controller) do
  Thread.fork do
    while true
      ActionCable.server.broadcast 'home', Time.now.to_s
      sleep 0.5
    end
  end
end
