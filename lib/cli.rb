class CLI
  def run
    #runner function - combines other functions
    welcome
    login_prompt
  end

  def welcome
    puts "Welcome! At the following screens, enter the number for your choice and press ENTER/RETURN:"
  end

  def login_prompt
    puts "[1] Log in\n[2] Create account\n[3] GTFO"
  end
end
