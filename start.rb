float1 = 0.0
float2 = 1.0
float3 = 0.0
assesment = 0.0
x = 0
while x < 100000
    float1 = rand(-4.0..4.0)
    float2 = rand(-4.0..4.0)
    float3 = rand(-4.0..4.0)
    assesment = (float3*(2019^3))+(float2*(2019^2))+(float1*(2019))
    if assesment.floor == 1623 
    File.write("susaddress.txt", "#{float3}x^3+#{float2}x^2+#{float1}x#{$/}", mode: 'a')
    File.write("susaddress.txt", "#{assesment}x#{$/}", mode: 'a')
    end
    x+=1
end