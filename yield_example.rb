#Yield 
def greet_general
    puts "Hello"
    yield if block_given?
    puts "Goodbye"
end
  
greet_general { puts "How are you?" }

#Yield with Arguments
def greet_someone
    puts "Hello"
    yield("John") if block_given?
    puts "Goodbye"
end
  
greet_someone { |name| puts "How are you, #{name}?" }

