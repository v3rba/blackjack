require_relative 'round'

class MyGame
  def initialize(interface)
    @interface = interface
  end

  def run
    create_user
    new_round
    loop do
      continue
    end
  end

  private

  def create_user
    @interface.enter_name
    @user = User.new(@name)
  end

  def continue
    @interface.message_to_continue
    choice = @interface.choice
    if choice == 'y'
      new_round
    elsif choice == 'n'
      exit
    else
      @interface.selection_error
    end
  end

  def new_round
    if @user.cash.zero?
      puts 'Insufficient funds'
      exit
    else
      Round.new(@user, @interface).run
    end
  end
end
