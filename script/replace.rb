#! /usr/bin/ruby

# Move all headlines one level up. pandoc messes that up, somehow
contents = File.open('Inhalt.tex').read
contents = contents.gsub('\section', '\chapter').gsub('\subsection', '\section').gsub('\subsubsection', '\subsection') 
File.open('Inhalt.tex', 'w') {|f| f.write contents}
