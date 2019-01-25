#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

require "pry"

my_songs = {
  "Go Go GO" => 'C:\Users\Yayzik\.atom\.learn-ide\home\classy-zombie-8275\jukebox-cli-seattle-web-career-021819\audio\Emerald-Park\01.mp3',
  "LiberTeens" => 'C:\Users\Yayzik\.atom\.learn-ide\home\classy-zombie-8275\jukebox-cli-seattle-web-career-021819\audio\Emerald-Park\02.mp3',
  "Hamburg" =>  'C:\Users\Yayzik\.atom\.learn-ide\home\classy-zombie-8275\jukebox-cli-seattle-web-career-021819\audio\Emerald-Park\03.mp3',
  "Guiding Light" => 'C:\Users\Yayzik\.atom\.learn-ide\home\classy-zombie-8275\jukebox-cli-seattle-web-career-021819\audio\Emerald-Park\04.mp3',
  "Wolf" => 'C:\Users\Yayzik\.atom\.learn-ide\home\classy-zombie-8275\jukebox-cli-seattle-web-career-021819\audio\Emerald-Park\05.mp3',
  "Blue" => 'C:\Users\Yayzik\.atom\.learn-ide\home\classy-zombie-8275\jukebox-cli-seattle-web-career-021819\audio\Emerald-Park\06.mp3',
  "Graduation Failed" => 'C:\Users\Yayzik\.atom\.learn-ide\home\classy-zombie-8275\jukebox-cli-seattle-web-career-021819\audio\Emerald-Park\07.mp3'
}

def help
  puts "I can accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end



def list(my_songs)
  counter = 1
  my_songs.each_key do |the_song|
    puts "#{counter}. #{the_song}"
    counter += 1
  end
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  puts "Please enter a song name or number:"
  user_input = gets.chomp
  my_songs.each_key do |song_string|
    if song_string.include?(user_input)
      puts "Playing #{song_string}"
      file_path = my_songs[song_string]
      system "open #{file_path}"
    else
      puts "Invalid input, please try again"
    end
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(my_songs)
  help
  puts "Please enter a command:"
  user_input = gets.chomp
  until user_input == "exit"
    if user_input == "help"
      help
      puts "Please enter a command:"
      user_input = gets.chomp
    elsif user_input == "list"
      list(my_songs)
      puts "Please enter a command:"
      user_input = gets.chomp
    elsif user_input == "play"
      play(my_songs)
      puts "Please enter a command:"
      user_input = gets.chomp
    end
  end
  exit_jukebox
end
