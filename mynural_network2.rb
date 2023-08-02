require 'csv'

#EDIT ONLY THESE FIELDS
attackType = ["[SYN]","SYN"]
attackWeight = 3 #default 3
holdingCellWeight = 1000 #default 1000
ipWeight = 200 #default 200
#DONT EDIT ANYTHINY ELSE
attackList = []
ip_data = []
holdingCell = []
globalTableCounter = 0
globalCounterDump = 0
class IPADDRESS #creates object veriables for each object
    attr_accessor :ipaddress, :time
end
def storeData(x,z)
    temp = IPADDRESS.new
    temp.ipaddress = x
    temp.time = z
    return temp
end
CSV.foreach("csvoutput.csv", :headers => true) do |row|
globalTableCounter += 1
    tracker = 0
    if ip_data.include? (row[2])
        if  (row[6].to_s.match(/\[([^]]+)\]/)).to_s.match(attackType[0])
            holdingCell.push(storeData(row[2],row[1]))
            tracker += 1
        else
            tracker += 1
        end
    end
    if tracker == 0
        ip_data.push(row[2].to_s)
    else
    end
    if ip_data.length > 200 || holdingCell.length > 1000

        #how many times does each ip_data show up in the holding cell
        
        ip_data.each_with_index do |value1 , index|
            attackTracker = 0
            if holdingCell.each.include? (value1)
                attackTracker += 1
            end
            if attackTracker > attackWeight
                attackList.push(ip_data[value2.id])
            end
        end





        ip_data.each_with_index do |value1 , index|#for each ip address
            counter = 0
            attackTracker = 0
            holdingCell.each_with_index do |value2, index2| #search for attacks
                if value2.id == index
                    counter += 1
                    p "#{value1} #{index} #{value2.id}"
                end
                if counter > attackWeight
                    #SAVE THE ATTACK DATA TO THE TRACKER
                    p "#{value1} #{index} #{value2.id} #{counter}"
                    attackList.push(ip_data[value2.id])
                    IO.write("outputarray.txt", attackList.join("\n"))
                    #END OF SAVE ATTACK DATA
                end
            end
        end
        ip_data = []
        holdingCell = []
        globalTableCounter = 0
        globalCounterDump = 0
    end
end


