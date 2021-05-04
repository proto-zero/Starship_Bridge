# Starship Bridge Systems Manager
class Starship

# Ship Variables
  def initialize
    @shields    = false
    @phasers    = false
    @photons    = false
    @alert      = 'No Alert'
    @engines    = 'Full Stop'
    @sensors    = []
    @shipname   = ''
    @captname   = ''
    @lw         = 60

# Startup Screen
    system("clear")
    puts 'Bridge Systems Activated'
    puts
    sleep 2
    puts 'Now Calibrating...'
    sleep 1
    5.times do puts '...'
    end
    sleep 1
    5.times do puts '...'
    end
    puts
    sleep 1
    puts 'Calibration Complete'
    puts
    sleep 3

# Name Input
    system("clear")
    puts 'Enter Ship\'s Name:'
    @shipname = gets.chomp
    puts
    puts 'Enter Captain\'s Name:'
    @captname = gets.chomp
    status ('Welcome Captain ' + @captname.capitalize + ' to the USS ' + @shipname.capitalize + '.').center @lw
  end

# Status Screen of Ship's Systems
  def status x
    system("clear")
    puts x.center @lw
    puts
    puts ('USS ' + @shipname.capitalize + ' Command Interface').center(35)
    puts
    if @phasers
      puts 'Phasers:                    Armed'
    else
      puts 'Phasers:              Disarmed'
    end

    if @photons
      puts 'Photon Torpedoes:           Armed'
    else
      puts 'Photon Torpedoes:     Disarmed'
    end

    if @shields
      puts 'Shields:                    Raised'
    else
      puts 'Shields:              Lowered'
    end

    puts 'Alert:                ' + @alert
    puts 'Engines:              ' + @engines

    if @sensors == []
      puts 'Sensors:              None Selected'
    else
      puts 'Sensors:              ' + @sensors.join(', ')
    end

    select
  end

# Selection of various Ship's Systems
  def select
    puts
    puts 'Select System:'
    puts 'Phasers, Torpedoes, Shields, Alerts, Engines, Sensors, Exit'
    answer = gets.chomp.downcase

    while answer != 'exit'

# Phasers
      if answer.include?('phaser')
        if @phasers
          @phasers = false
          status 'Phasers are Disarmed.'
        else
          @phasers = true
          status 'Phasers are Armed and Ready.'
        end

# Torpedoes
      elsif answer.include?('torpedo')

        if @photons
          @photons = false
          status 'Photon Torpedoes are Disarmed.'
        else
          @photons = true
          status 'Photon Torpedoes are Armed and Ready.'
        end

# Shields
      elsif answer.include?('shield')

        if @shields
          @shields = false
          status 'Lowering Shields.'
        else
          @shields = true
          status 'Raising Shields.'
        end

# Alerts
      elsif answer.include?('alert')
        alerts = ['no alert', 'yellow alert', 'red alert']
        puts
        puts 'Select Alert Status:'
        puts 'No Alert, Yellow Alert, Red Alert'
        response = gets.chomp.downcase

        while !alerts.include?(response)
          puts
          puts 'Command Not Recognized.'.center @lw
          response = gets.chomp.downcase
        end

        if response == 'no alert'
          @alert = 'No Alert'
          status 'Alert Status set to No Alert.'
        elsif response == 'yellow alert'
          @alert = '   Yellow Alert'
          status 'Alert Status set to Yellow Alert.'
        elsif response == 'red alert'
          @alert = '      Red Alert'
          status 'Alert Status set to Red Alert.'
        end

# Engines
      elsif answer.include?('engine')
        engines = ['impulse', 'warp']
        puts
        puts 'Select Engine:'
        puts 'Impulse, Warp'
        response2 = gets.chomp.downcase

        while !engines.include?(response2)
          puts
          puts 'Command Not Recognized.'.center @lw
          response2 = gets.chomp.downcase
        end


# Impulse Engine Selection
        if response2 == 'impulse'
          speed = ['full stop', '1/4', '1/3', '1/2', '2/3', 'full impulse']
          puts
          puts 'Select Impulse Speed:'
          puts 'Full Stop, 1/4, 1/3, 1/2, 2/3, Full Impulse'
          response3 = gets.chomp.downcase

          while !speed.include?(response3)
            puts
            puts 'Command Not Recognized.'.center @lw
            response3 = gets.chomp.downcase
          end
          puts

# Impulse Engine Speeds
          if response3 == 'full stop'
            @engines = 'Full Stop'
            status 'Impulse Engines at Full Stop.'
          elsif response3 == '1/4'
            @engines = ' 1/4 Impulse'
            status 'Impulse Engines at 1/4.'
          elsif response3 == '1/3'
            @engines = ' 1/3 Impulse'
            status 'Impulse Engines at 1/3.'
          elsif response3 == '1/2'
            @engines = '  1/2 Impulse'
            status 'Impulse Engines at 1/2.'
          elsif response3 == '2/3'
            @engines = '    2/3 Impulse'
            status 'Impulse Engines at 2/3.'
          elsif response3 == 'full impulse'
            @engines = '      Full Impulse'
            status 'Impulse Engines All Ahead Full.'
          end

# Warp Engine Selection
        elsif response2 == 'warp'
          warp = 1..9
          puts
          puts 'Select Warp Speed:'
          puts '1 - 9'
          response4 = gets.chomp.to_i

          while !warp.include?(response4)
            puts
            puts 'Command Not Recognized.'.center @lw
            response4 = gets.chomp.to_i
          end
          puts

# Warp Engine Speeds
          @engines = '       Warp ' + response4.to_s
          status ('Warp Engines Engaged.
            Now at Warp ' + response4.to_s + '.')
        end

# Sensors
      elsif answer.include?('sensor')
        sensorlist = ['Geological Scan', 'High Resolution Scan', 'Internal Scan',
                      'Long Range Sensor Scan', 'Magneton Scan', 'Navigational Scan',
                      'Multiphasic Scan', 'Subspace Differential Pulse', 'Inverse Tachyon Pulse']
                      puts
        puts 'Select Sensor Array:'
        sensorlist.each do |x|
          puts x
        end
        puts
        response4 = (gets.chomp).split.map(&:capitalize).join(' ')

        while !sensorlist.include?(response4)
          puts
          puts 'Command Not Recognized.'.center @lw
          response4 = (gets.chomp).split.map(&:capitalize).join(' ')
        end

        if !@sensors.include?(response4)
          @sensors.push(response4)
          status (response4 + ' Activated.')
        elsif @sensors.include?(response4)
          @sensors.delete(response4)
          status (response4 + ' Deactivated.')
        end

# Else
      else
        puts
        puts 'Command Not Recognized.'.center @lw
        answer = gets.chomp.downcase
      end

    end
    exit
  end
end

Starship.new
