#! /usr/bin/ruby

# Move all headlines one level up. pandoc messes that up, somehow
contents = ARGF.read
contents = contents.gsub('\section', '\chapter').gsub('\subsection', '\section').gsub('\subsubsection', '\subsection')
# Set default image width to linewidth
contents = contents.gsub('\includegraphics{', '\includegraphics[width=\linewidth]{')
print contents
