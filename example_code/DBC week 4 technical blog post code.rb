

# array.group_by{ |obj| block }

# returns a hash




students = ["Jennifer Miller", "Jason Miller", "Barack Obama", "Hillary Clinton"]

grouped_hash = students.group_by { |name| name[0]}

print grouped_hash

# returns : {
# "J"=>["Jennifer Miller", "Jason Miller"], 
# "B"=>["Barack Obama"], 
# "H"=>["Hillary Clinton"]
# }


