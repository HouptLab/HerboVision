require "csv"
i = 0
CSV.foreach("herb_full_from_1970.txt",  {headers: true, col_sep: "\t"}) do |row|
 
# format: 1163457483|chuck|M|/test/foo.txt
  timestamp = Date.parse(row[5]).strftime("%s"); 
  species = row[2].strip.gsub(" ", "/");
  collector = row[3].split(",").first.split(" ").last
#  print "#{timestamp}|#{collector}|M|/#{row[1]}/#{species}/#{row[0]}.#{collector}\n"
  if i % 1 == 0
    print "#{timestamp}|#{collector}|M|/#{row[1]}/#{species}/#{row[0]}.#{collector}\n"
  end
  i = i + 1
end
