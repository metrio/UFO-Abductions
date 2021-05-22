require_relative '../config/environment'
require_all 'lib'
prompt = TTY::Prompt.new
cli = CLI.new
cli.main_menu

