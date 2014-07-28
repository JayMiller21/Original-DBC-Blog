#Blocks and methods are not objects

#Blocks

array = [1, 2, 3, 4]
array.map! { |x| x*2 }

array
# [2, 4, 6, 8]


#Methods

def doubler_method(array)
	array.map! { |x| x*2 }
end

doubler_method([1, 2, 3, 4])
# [2, 4, 6, 8] 

#Proc & Lambda Syntax
##They are objects and invoked with ".call"

#Proc

doubler_proc = Proc.new do |array|
array.map! { |x| x*2 }
end

doubler_proc.call([1, 2, 3, 4])
# [2, 4, 6, 8] 

#Lambda

doubler_lambda = lambda do |array|
array.map! { |x| x*2 }
end 

doubler_lambda.call([1, 2, 3, 4])
# [2, 4, 6, 8] 

#Proc & Lambda argument quantity

doubler_proc.call([1, 2, 3, 4], "ignored argument")
# [2, 4, 6, 8] 

doubler_lambda.call([1, 2, 3, 4], "error-causing argument")
# ArgumentError: wrong number of arguments (2 for 1)

#Proc & Lambda return

def containing_proc(array)
doubler_proc = Proc.new do |array|
return array.map! { |x| x*2 }
end
doubler_proc.call(array)
return "I won't be returned"
end

containing_proc([1, 2, 3, 4])
# [2, 4, 6, 8] 

def containing_lambda(array)
doubler_lambda = lambda do |array|
return array.map! { |x| x*2 }
end 
doubler_lambda.call(array)
return "I'll be returned"
end

containing_lambda([1, 2, 3, 4])
# "I'll be returned"


#Curiously, the string after the proc is returned:
# def containing_proc
# doubler_proc = Proc.new do |array|
# array.map! { |x| x*2 }
# end
# doubler_proc.call([1, 2, 3, 4])
# return "I won't be returned"
# end
