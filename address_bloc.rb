require_relative 'controllers/menu_controller'

menu = MenuController.new
system "clear"
p "Welcom to AddressBloc!"

menu.main_menu
