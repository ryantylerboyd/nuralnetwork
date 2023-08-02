lol = [{:name => "blake"}, {:name => "blake"}, {:name => "ashley"}]

apple  = 1
tracker =0
if lol.each.include? (apple)
    tracker += 1
end
p tracker
test = lol.tally.map {|k, v| k.merge({count: v}) }
p test[0].count


a = "potato"
