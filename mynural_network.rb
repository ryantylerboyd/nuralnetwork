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
    attr_accessor :id, :time
end
def matchtracker(x,y)
    if x.match(y)
        return true
    end
end
def storeData(x,z)
    temp = IPADDRESS.new
    temp.id = x
    temp.time = z
    return temp
end
p "[System] Processing CSV"
CSV.foreach("csvoutput.csv", :headers => true) do |row|
globalTableCounter += 1
tracker = 0
    ip_data.each_with_index do |val, index|
         if row[2].match(val) 
            if  (row[6].to_s.match(/\[([^]]+)\]/)).to_s.match(attackType[0])
            holdingCell.push(storeData(index,row[1]))
            tracker += 1
            else
                tracker += 1
            end
         end
    end
    if tracker == 0
        ip_data.push(row[2].to_s)
        tracker = 0
    else
    end
    if (globalTableCounter-globalCounterDump) > 10000
        #p "#{ip_data.length} #{holdingCell.length} #{globalTableCounter}"
        globalCounterDump=globalTableCounter
    end
    if ip_data.length > 200 || holdingCell.length > 1000
                p "[System] Processing data"
        ip_data.each_with_index do |value1 , index|#for each ip address
            
            
            counter = 0
            attackTracker = 0
            holdingCell.each_with_index do |value2, index2| #search for attacks
                #p "#{value1} #{index} #{value2.id}"
                if value2.id == index
                    #p "#{value2.} #{attackType[0]}"
                    counter += 1
                end
                if counter > attackWeight
                    p "attack from #{ip_data[value2.id]}"
                    #SAVE THE ATTACK DATA TO THE TRACKER
                    
                    attackList.push(ip_data[value2.id])
                    IO.write("outputarray.txt", attackList.join("\n"))
                    
                    #END OF SAVE ATTACK DATA
                end
            end
        end
        #p attackList
        ip_data = []
        holdingCell = []
        globalTableCounter = 0
        globalCounterDump = 0
        p "[System] Processing CSV"
    end
end


