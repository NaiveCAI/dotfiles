Pry.config.hooks.add_hook(:before_session, :rails) do
  if defined?(Rails)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end
end

Pry::Commands.command /^$/, "repeat last command" do
  pry_instance.run_command Pry.history.to_a.last
end
