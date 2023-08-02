require 'csv'
#HEllo and welcome to my learning program of nural netowrk stuff
#This is my very first file so dont be mean :)
#CHANGEABLE VERABLES
serverIpAddress = "51.222.245.179"
#CHANGEABLE VERABLES
ip_data_known = [] #STORES IP DATA
ip_data_bank = []
ip_data_sus = []
weights = [0,0,0] #STORES RANDOM WEIGHTS TO LEARN
importData = []
weight_history = []

class WIRESHARKCSV
    attr_accessor :id, :time, :source, :destination, :protocol, :length , :info
end
#GENERATE A RANDOM WEIGHT

CSV.foreach("attack.csv", :headers => true) do |row|
    storeBot = WIRESHARKCSV.new
    storeBot.id = row[0]
    storeBot.time = row[1]
    storeBot.source = row[2]
    storeBot.destination = row[3]
    storeBot.protocol = row[4]
    storeBot.length = row[5]
    storeBot.info = row[6]
    importData.push(storeBot)
end

importData.each_with_index do |var,index| #For each data imported
#DOES IT INCLUDE APPLICATION DATA?
#YES THEN IS IT ON THE LIST ALREADY?
#NO IS IT ON THE MABYE LIST?
        if var.info.include? ("Application Data") #dose it include applicaiton data in the packet
            if ip_data_known.include? (var.source) #is it already stored in the known data if yes then
                #do nothing
            else#if it is not stored 
                #push the new ip address
                ip_data_known.push(var.source)
                p "pushed"
            end
        end
    if ip_data_bank.include? (var.source) 
    else
        ip_data_bank.push(var.source)
    end
end

ip_data_bank.each_with_index do |var, index|
    if ip_data_known.include? (var)
    else
        if ip_data_sus.include? (var)
        else
            ip_data_sus.push(var)
        end
    end
end
IO.write("safeaddress.txt", ip_data_known.join("\n"))
IO.write("susaddress.txt", ip_data_sus.join("\n"))


p "[SYSTEM PRINTER] IMPORTDATA=[#{importData.length}] IPDATA=[#{ip_data_bank.length}]"
p "[System] SafeIP=[#{ip_data_known.length}] SusIP=[#{ip_data_sus.length}]"