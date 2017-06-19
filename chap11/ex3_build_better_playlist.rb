=begin

Build a better playlist. After listening to playlists for a while, you might
start to find that a purely random shuffle just doesn’t quite seem...mixed
up enough. (Random and mixed up are not at all the same thing. Random
is totally clumpy.) For example, here’s an excerpt from a playlist I made
a while back of Thelonius Monk and Faith No More:

music/Jazz/Monk--Nutty/track08.ogg
music/Jazz/Monk--London_Collection_1/track05.ogg
music/Jazz/Monk--Nutty/track13.ogg
music/Jazz/Monk--Round_Midnight/track02.ogg
music/Jazz/Monk--Round_Midnight/track14.ogg
music/Jazz/Monk--Round_Midnight/track15.ogg
music/Jazz/Monk--Round_Midnight/track08.ogg
music/Rock/FNM--Who_Cares_A_Lot_2/track02.ogg
music/Rock/FNM--Who_Cares_A_Lot_2/track08.ogg
music/Rock/FNM--Who_Cares_A_Lot_1/track02.ogg
music/Rock/FNM--Who_Cares_A_Lot_2/track01.ogg

Hey! I asked for random! Well, that’s exactly what I got...but I wanted
mixed up. So, here’s the grand challenge: instead of using your old shuffle,
write a new music_shuffle method. It should take an array of filenames (like
those listed previously) and mix them up good and proper.
You’ll probably need to use the split method for strings. It returns an array
of chopped-up pieces of the original string, split where you specify, like
this:

awooga = 'this/is/not/a/daffodil'.split '/'
puts awooga

this
is
not
a
daffodil

Mix it up as best you can!
=end

def music_shuffle filenames
	songs_and_paths = filenames.map do |s|
		[s, s.split('/')]	#  	[song, path] path returns an array consisting of eg : ['c:', 'music', 'guitar']
	end
	
	tree = {:root => []}
# 	put each song into the tree

	insert_into_tree = proc do |branch, song, path|
		if path.length == 0 # add to current branch
			branch[:root] << song
		else # delve deeper
			sub_branch = path[0]
			path.shift # like "pop, but pops off the front

		if !branch[sub_branch]
			branch[sub_branch] = {:root => []}
		end
		insert_into_tree[branch[sub_branch], song, path]
		end
	end

	songs_and_paths.each{|sp| insert_into_tree[tree, *sp]}

	# recursively:
	#   - shuffle sub-branches (and root)
	#   - weight each sub-branch (and root)
	#   - merge (shuffle) these groups together

	shuffle_branch = proc do |branch|
	shuffled_subs = []

	branch.each do |key, unshuffled|
		shuffled_subs << if key == :root
			unshuffled #At this level, these are all duplicates
		else
			shuffle_branch[unshuffled]
		end
	end

	weighted_songs = []

	shuffled_subs.each do |shuffled_songs|
		shuffled_songs.each_with_index do |song, idx|
			num = shuffled_songs.length.to_f
			weight = (idx + rand) / num
			weighted_songs << [song, weight]
		end
	end

	weighted_songs.sort_by{|s,v| v}.map{|s,v| s}
end
shuffle_branch[tree]
end



Dir.chdir 'D:/Music' # changes the working directory, originally its the dir where the .rb file resides

song_names = music_shuffle(Dir['D:/Music/**/*.ogg']) # dir from where we want to copy files

filename = 'better_ruby_playlist.m3u'

File.open filename, 'w' do |f|
		song_names.each do |name|
		
		f.write name +"\n"
		
	end
end

puts "Done!"