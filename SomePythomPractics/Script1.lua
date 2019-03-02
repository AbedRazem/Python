 function split(pString, pPattern)
   local Table = {}  
   local fpat = "(.-)" .. pPattern
   local last_end = 1
   local s, e, cap = pString:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
     table.insert(Table,cap)
      end
      last_end = e+1
      s, e, cap = pString:find(fpat, last_end)
   end
   if last_end <= #pString then
      cap = pString:sub(last_end)
      table.insert(Table, cap)
   end
   return Table
end
 local file = io.open("C:\\TestLogFile.log","r")
counter = 0 
StrtTimeArray = {}
EndTimeArray={}
TotalHours = 0 
TotalMinets = 0 
TotalSec = 0 
TotalMls = 0 

while true do
        line = file:read() -- Read line , then seek cursor 
        if line == nil then break end -- break if null 
		
        --print (line)
if string.find(line, "money") then  -- process start here 
		i = 0                       -- index for the array 
		counter=counter+1 -- counter the number of the processes , start 
    
		print ("Splitting the line .....[["..line.."]]")
    
    Startlist=split(line," ")
    
    print ("Splitting Starting time ....[["..Startlist[1].."]]")
    
    tmpTimelist=split(Startlist[1],":")
    StrtTimeArray[i]=tmpTimelist[1]
    print(StrtTimeArray[i])
    i=i+1
    StrtTimeArray[i]=tmpTimelist[2]
    print(StrtTimeArray[i])
    i=i+1
    StrtTimeArray[i]=tmpTimelist[3]
    print(StrtTimeArray[i])
    i=i+1
    StrtTimeArray[i]=tmpTimelist[4]
    print(StrtTimeArray[i])
end
if string.find(line,"approved") then  -- process end here 
		k =0 -- index for array 
		print ("Splitting the line ...[["..line.."]]")
    Endlist=split(line," ")
    
    print ("Splitting Ending time  ...[["..Endlist[1].."]]")
    
    tmpEndTimelist=split(Endlist[1],":")
    
    EndTimeArray[k]=tmpEndTimelist[1]
    print(EndTimeArray[k])
    k=k+1
    EndTimeArray[k]=tmpEndTimelist[2]
    print(EndTimeArray[k])
    k=k+1
    EndTimeArray[k]=tmpEndTimelist[3]
    print(EndTimeArray[k])
    k=k+1
    EndTimeArray[k]=tmpEndTimelist[4]
    print(EndTimeArray[k])
    ---------------------------
    TotalHours = TotalHours +(EndTimeArray[0] - StrtTimeArray[0]) 
		TotalMinets = TotalMinets + (EndTimeArray[1] - StrtTimeArray[1])
		TotalSec    = TotalSec    + (EndTimeArray[2] - StrtTimeArray[2])
		TotalMls    = TotalMls    + (EndTimeArray[3] - StrtTimeArray[3])
   
   end -- end if of the end process 
   
end   -- end while 
    print(counter .. " Transaction AVG time: ")
		print("hours:"..TotalHours/counter)
		print("Minutes:"..TotalMinets/counter)
		print("Seconds:"..TotalSec/counter)
		print("MilSeconds:"..TotalMls/counter)