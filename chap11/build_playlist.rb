=begin

Build your own playlist. For this to work, you need to have some music
ripped to your computer in some format. We’ve ripped a hundred or so
CDs, and we keep them in directories something like music/genre/
artist_and_cd_name/track_number.ogg. (I’m partial to the .ogg format, though this
would work just as well with .mp3s or whatever you use.)
Building a playlist is easy. It’s just a regular text file (no YAML required,
even). Each line is a filename, like this:

music/world/Stereolab--Margarine_Eclipse/track05.ogg

What makes it a playlist? Well, you have to give the file the .m3u extension,
like playlist.m3u or something. And that’s all a playlist is: a text file with an
.m3u extension. 

So, have your program search for various music files and build you a
playlist. Use your shuffle method on page 75 to mix up your playlist. Then
check it out in your favorite music player (Winamp, MPlayer, and so on)!

=end

# Shuffle methods
def shuffle array
    recursive_shuffle array, []
end

def recursive_shuffle unshuffled, shuffled
    return shuffled if unshuffled.length <= 0
    shuffled.push(unshuffled.delete_at(rand(unshuffled.length)))
    recursive_shuffle unshuffled, shuffled
end


#Find all music files
song_names = shuffle(Dir['/home/ubuntu/workspace/learn-to-program/chap11/playlist_test/**/*.mp3'])

#Change directory
Dir.chdir '/home/ubuntu/workspace/learn-to-program/chap11/playlist_test'

playlist_filename = "new_playlist.m3u"

File.open playlist_filename, 'w' do |file|
    song_names.each do |song|
        file.write song + "\n"
    end
end
