require './rb/include.rb'


def background_text()
    setpos(0, 0)
    (0..cols * lines).each do
        case rand(64)
            when 0; addstr('.')
            when 1; addstr(',')
        else
            addstr(' ')
        end
    end
end

def clear()
    background_text()
    refresh()
end

def show_message(message, wait = true)
    message = [message] if message.is_a?(String)
    x_pad, y_pad = 4, 2
    height = message.length + y_pad * 2
    width = message.to_a.map(&:length).max + x_pad * 2
    win = Window.new(height, width, (lines - height) / 2, (cols - width) / 2)
    win.box(?|, ?=)
    message.each_with_index do |string, index|
        win.setpos(y_pad + index, x_pad)
        win.addstr(string)
    end
    win.refresh
    value = wait ? win.getch : ""
    win.close
    return value
end

def manage_firebase_console
    # Draw menu
    clear()
    value = show_message([
        "Manage Firebase console",
        "",
        "1 - View console",
        "2 - Clear console",
        "",
        "ESC - Back"
    ])
    # Call program
    case value.to_s
    when "2"
        clear()
        show_message("Clearing console...", false)
        console = Console.new.clear
        clear()
        show_message("Console cleared")
        manage_firebase_console()
    when "27"
        main_menu()
    else
        clear()
        show_message("\"#{value}\" is an invalid menu option")
        manage_firebase_console()
    end
end

def main_menu
    # Draw menu
    clear()
    value = show_message([
        "Main menu", 
        "",
        "1 - Manage users",
        "2 - View storage usage",
        "3 - View concurrent users",
        "4 - Manage Firebase console",
        "",
        "ESC - Quit to console"
    ])
    # Call program
    case value.to_s
    when "1"
        clear()
        show_message("Manage users")
    when "2"
        clear()
        show_message("View storage usage")
    when "3"
        clear()
        show_message("View concurrent users")
    when "4"
        manage_firebase_console()
    when "27"
        exit(0)
    else
        clear()
        show_message("\"#{value}\" is an invalid menu option")
        main_menu()
    end
end
  
init_screen()
begin
    crmode()
    # Splash screen
    clear()
    show_message("Welcome to EdiPanel controller")
    # Options
    main_menu()
ensure
    close_screen()
end