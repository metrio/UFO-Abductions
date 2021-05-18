require_relative '../config/environment'
prompt = TTY::Prompt.new

require_all 'lib'
require_all './apps'

cli = CLI.new

cli.main_menu

