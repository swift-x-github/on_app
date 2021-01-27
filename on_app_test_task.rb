# use  json gem 
require 'json'

def hello_message
    puts "Type here your query ...(Q -exit)"
end

def exit_program
    # say Bye -)))
    puts "Bye" + "." * 20   
end

def sorry_message
    puts "Sorry, no found \n"
end

def success_masseage(num)
    puts "we have  #{num} items \n"
end

def make_search(search_query)
    # reading the file
    file = File.read('./data.json')

    # parsing the file to array
    data_array = JSON.parse(file)
    # change search string's registry to downcase
    search_query = search_query.downcase
    # find query in array
    search_result = data_array.find_all {|x|                         
                                x["Name"].downcase.include?(search_query )            \
                            or  x["Type"].downcase.include?(search_query )            \
                            or  x["Designed by"].downcase.include?(search_query )
                                        } 
    if  search_result.length > 0
            # print how many items we have
        success_masseage(search_result.length)
            # print all searched items 
        search_result.each do |n|
            puts n
        end
    else  
            # print sorry message if have not results
       sorry_message
    end
end

# main program
loop do 
    # say hello message
    hello_message
    # get the query
    search_query = gets.chomp
    # check for exit signal
   
    if search_query.downcase == "q"
        exit_program
        break
    end
    #make a search
    make_search(search_query)  
    # loop
end
