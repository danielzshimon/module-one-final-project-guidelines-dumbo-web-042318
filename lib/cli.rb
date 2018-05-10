class CLI
  attr_reader :input

  def run
    #runner function - combines other functions
    welcome
    login_or_signup
  end

  def welcome
    puts "Welcome! At the following screens, enter the number\nfor your choice and press ENTER/RETURN:\n\n"
  end

  def get_user_input
    @input = gets.chomp
  end

  def login_or_signup
    print "[1] Log in\n[2] Create account\n[3] GTFO\n\nEnter choice: "
    get_user_input
    case self.input
    when "1"
      login_prompt
    when "2"
      signup_prompt
    when "3"
      exit
    else
      puts "Please enter a valid choice."
    end
  end

  def login_prompt
    print "Enter account email: "
    get_user_input
  end

  def signup_prompt
    print "Please provide the following information:\n\nEmail address: "
    get_user_input
    email = self.input
    print "Name: "
    get_user_input
    name = self.input
    puts "Creating account..."
    User.create(name: name, email: email)
    puts "Account created!"
  end
end
