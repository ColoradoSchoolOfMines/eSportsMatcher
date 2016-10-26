
# Try loading a YAML file at `./config/env.[environment].yml`, if it exists
# Kudos to Thomas Fuchs (http://mir.aculo.us) for the initial implementation
def load_env_file(environment = nil)
  path = Rails.root.join("config", "env#{environment.nil? ? '' : '.'+environment}.yml")
  return unless File.exist? path
  config = YAML.load(ERB.new(File.new(path).read).result)
  config.each { |key, value| ENV[key.to_s] = value.to_s }
end

# load default environment variables. config/env.yml (if it exists)
load_env_file

# load custom environment variables stored in env.[environment].yml
# will overwrite any defaults from 'config/env.yml' previously loaded
load_env_file(Rails.env)
