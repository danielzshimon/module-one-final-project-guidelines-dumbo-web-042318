class CLI
  attr_reader :input, :user

  def run
    #runner function - combines other functions
    cls
    welcome
    login_or_signup
  end

  def cls
    clear_code = %x{clear}
    print clear_code
  end

  def welcome
    puts "Welcome! At the following screens, enter the number\nfor your choice and press ENTER/RETURN:\n".light_cyan
  end

  def get_user_input
    @input = gets.chomp
  end

  def login_or_signup
    print "[1] Log in\n[2] Create account\n[3] GTFO\n\n"
    print "Enter choice: ".green
    get_user_input
    case self.input
    when "1"
      login_prompt
    when "2"
      signup_prompt
    when "3"
      cls
      abort("FUGHEDDABOUTIT!")
    else
      cls
      puts "Please enter a valid choice.".red
      login_or_signup
    end
  end

  def login_prompt
      print "Enter account email: "
      get_user_input
      user = User.find_by email: self.input
      if user == nil
        cls
        puts "User does not exist.\n\n"
        login_or_signup
      else
        @user = user
        cls
        user_menu
      end
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

  def user_menu
    print "Welcome back, #{self.user.name}!\n\n[1] Create new trip\n[2] See my trip(s)\n[3] See status for a specific subway line\n[4] See all lines with service advisories\n[5] Log out and return to main menu\n\n"
    print "Enter choice: ".green
    get_user_input
    case self.input
    when "1"
      create_trip_prompt
    when "2"
      display_all_user_trips
    when "3"
      line_status_prompt
    when "4"
      display_service_advisories
    when "5"
      @user = nil
      cls
      welcome
      login_or_signup
    else
      cls
      puts "Please enter a valid choice.".red
      user_menu
    end
  end

  def create_trip_prompt
    #prompt user for origin
    print "Please enter your trip origin: "
    origin = get_user_input
    #prompt user for destination
    print "Please enter your trip destination: "
    destination = get_user_input
    #prompt user for trip lines
    print "Please enter subway lines for this trip, separated by commas: "
    trip_lines = get_user_input
    #create trip instance
    trip = Trip.create(origin: origin, destination: destination, user_id: self.user.id)
    #create tripline instance for each line
    trip_lines.upcase.split(",").each do | line |
      line_obj = Line.find_by name: line.strip
      TripLine.create(trip_id: trip.id, line_id: line_obj.id)
    end
  end

  def display_all_user_trips
    #get all user trips
    #display created date, origin, destination,  line statuses
  end

  def line_status_prompt
    #get line from user
    #if no statuses, tell this to user
    #otherwise put status, reason
  end

  def display_service_advisories
    #get all lines with service advisories
    #display line name, status, reason for each
  end
end
