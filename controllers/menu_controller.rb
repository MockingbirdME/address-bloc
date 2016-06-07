require_relative '../models/address_book.rb'

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    p "Main Menu - #{address_book.entries.count} entries"
    p "1 - View all entries"
    p "2 - Create an entry"
    p "3 - Search for an entry"
    p "4 - Import entries from a CSV"
    p "5 - Exit"
    p "6 - View entry number n"
    print "Enter your selection"

    selection = gets.to_i

    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        system "clear"
        p "Good-bye!"
        exit(0)
      when 6
        system "clear"
        print "select entry number"
        display_entry_n
      else
        system "clear"
        p "Sorry, that is not a valid input"
        main_menu
      end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      p entry.to_s
      entry_submenu(entry)
    end
    system "clears"
    p "End of entries"
  end
  def create_entry
    system "clear"
    p "New AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone_number = gets.chomp
    print "Email: "
    email = gets.chomp

    address_book.add_entry(name, phone_number, email)
    system "clear"
    p "New entry created for #{name}"
  end
  def search_entries
  end
  def read_csv
  end
  def entry_submenu(entry)
    p "n - next entry"
    p "d - delete entry"
    p "e - edit entry"
    p "m - return to main menu"
    selection = gets.chomp

    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        p "#{selection} is not valid input"
        entry_submenu(entry)
    end
  end
  def display_entry_n
    if address_book.entries.empty?
      p "\nAdd entries to AddressBloc before using this option\n"
      main_menu
    end
    print "What entry number would you like?"
    entry_n = gets.to_i
    if entry_n > address_book.entries.length-1
      system "clear"
      p "sorry, there is no #{entry_n}, please try again"
      display_entry_n
    end
    system "clear"
    p "Entry #{entry_n}: #{address_book.entries[entry_n].to_s}\n\n"
    main_menu

  end

end
