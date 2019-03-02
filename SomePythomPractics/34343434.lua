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

custmer="AbedRazem"

while true do
        line = file:read() -- Read line , then seek cursor 
        if line == nil then break end -- break if null 
        
        firstlist=split(line," ")
    counter = 0 
    StrtTimeArray = {}
    EndTimeArray={}
    TotalHours = 0 
    TotalMinets = 0 
    TotalSec = 0 
    TotalMls = 0
    if custmer ~= firstlist[2] then   --chech custmer name
    custmer=firstlist[2]
    prossID=firstlist[3]

    print("=====================================================")

    print (custmer.." "..prossID)
            -- counter the number of the processes , start
      end          ----End chech custmer name
      
  if custmer == firstlist[2] and prossID==firstlist[3] then  --main if for evry custmer and prossID
    
    if string.find(line, "money") and custmer == firstlist[2] and prossID==firstlist[3] then  -- process start time
    counter=counter+1           -- counter the number of the processes , start    

    
    i = 0                       -- index for the array 
		
		print ("Splitting the line .........[["..line.."]]")
    
    Startlist=split(line," ")
    
    print ("Splitting Starting time ....[["..Startlist[1].."]]")
    
    tmpTimelist=split(Startlist[1],":")
    StrtTimeArray[i]=tmpTimelist[1]
    --print(StrtTimeArray[i])
    i=i+1
    StrtTimeArray[i]=tmpTimelist[2]
    --print(StrtTimeArray[i])
    i=i+1
    StrtTimeArray[i]=tmpTimelist[3]
    --print(StrtTimeArray[i])
    i=i+1
    StrtTimeArray[i]=tmpTimelist[4]
    --print(StrtTimeArray[i])
    
    while true do
        line = file:read() -- Read line , then seek cursor 
        if line == nil then break end
        
    if  custmer == firstlist[2] and prossID==firstlist[3] and string.find(line,"approved") then  -- process end time 
		    k = 0 -- index for array 
        print ("Splitting the line .........[["..line.."]]")
        Endlist=split(line," ")
    
        print ("Splitting Ending time  .....[["..Endlist[1].."]]")
    
        tmpEndTimelist=split(Endlist[1],":")
    
        EndTimeArray[k]=tmpEndTimelist[1]
        -- print(EndTimeArray[k])
        k=k+1
        EndTimeArray[k]=tmpEndTimelist[2]
        --print(EndTimeArray[k])
        k=k+1
        EndTimeArray[k]=tmpEndTimelist[3]
        --print(EndTimeArray[k])
        k=k+1
        EndTimeArray[k]=tmpEndTimelist[4]
        --print(EndTimeArray[k])
        ---------------------------
        TotalHours  = TotalHours  + (EndTimeArray[0] - StrtTimeArray[0]) 
        TotalMinets = TotalMinets + (EndTimeArray[1] - StrtTimeArray[1])
        TotalSec    = TotalSec    + (EndTimeArray[2] - StrtTimeArray[2])
        TotalMls    = TotalMls    + (EndTimeArray[3] - StrtTimeArray[3])
   
    print("*****************************************************")
    print("Number of Transactions of "..custmer.." is "..counter)
    print("Transaction AVG time is: "..TotalHours/counter+TotalMinets/counter+TotalSec/counter+((TotalMls/counter)/100).." seconds")
		print(TotalHours.." Hours "..TotalMinets.." Minets "..TotalSec.." seconds "..TotalMls.." milsec")
		print("*****************************************************")
    break
    end --end if of Ending process
    
   end -- internal while 
  end -- end if of Starting process
 end  --end of main if for evry custmer and prossID
end   -- end while 
    