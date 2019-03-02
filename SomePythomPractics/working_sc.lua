----- function's here --------------------------
function string:split(delimiter)
  local result = { }
  local from = 1
  local delim_from, delim_to = string.find( self, delimiter, from )
  while delim_from do
    table.insert( result, string.sub( self, from , delim_from-1 ) )
    from = delim_to + 1
    delim_from, delim_to = string.find( self, delimiter, from )
  end
  table.insert( result, string.sub( self, from ) )
  return result
end
------- Program begin --------------------------------

local file = io.open("C:\\TestLog.log","r")
if file == nil then print("Could not Open the file ") end  
cnt = 0 
strt_info_array = {}
end_info_array={}
Total_hrs = 0 
Total_min = 0 
Total_sec = 0 
Total_mls = 0 

while true do
         line = file:read() -- Read line , then seek cursor 
        if line == nil then break end -- break if null 
			if string.find(line, "money loaded from queue") then  -- process start here 
		i = 0  -- index for the array 
		cnt=cnt+1 -- counter the number of the processes , start 
		print ("Splitting the line " .. line)
        morestuff = line
        have = morestuff.split(morestuff," +") -- split by spaces
        for index,today in pairs(have) do -- loop for printing the splited string
		 if index == 1 then print (today) tmp_time_start = today end -- getting the time start string 
		 end
		 -- fill in the start array with collected info -- 
		 strt_info_array[i]=string.sub(tmp_time_start,1,2)
     print(strt_info_array[i])
			i=i+1
      
      strt_info_array[i]=string.sub(tmp_time_start,4,5)
      print(strt_info_array[i])
			i=i+1
      
			strt_info_array[i]=string.sub(tmp_time_start,7,8)
      print(strt_info_array[i])
			i=i+1
      
			strt_info_array[i]=string.sub(tmp_time_start,10,12)
			print(strt_info_array[i])
       
		end -- end if (load money)
		if string.find(line,"approved") then  -- process end here 
		k =0 -- index for array 
		print ("Splitting the line ")
        morestuff = line
        have = morestuff.split(morestuff," +") -- split by spaces
        for index,today in pairs(have) do -- loop for printing the splited string
		        if index == 1 then tmp_time_end = today end
        end
   
      end_info_array[k]=string.sub(tmp_time_end, 1, 2)
      print(end_info_array[k])
			k=k+1
      end_info_array[k]=string.sub(tmp_time_end, 4, 5)
      print(end_info_array[k])
			k=k+1
			end_info_array[k]=string.sub(tmp_time_end, 7, 8)
      print(end_info_array[k])
			k=k+1
			end_info_array[k]=string.sub(tmp_time_end, 10, 12)
      print(end_info_array[k])
      
    
    Total_hrs = Total_hrs + (end_info_array[0] - strt_info_array[0]) 
		Total_min = Total_min + (end_info_array[1] - strt_info_array[1])
		Total_sec = Total_sec + (end_info_array[2] - strt_info_array[2])
		Total_mls = Total_mls + (end_info_array[3] - strt_info_array[3])
		end -- end if of the end process 
    

		
        end -- end while 
		
		print(cnt.." Transaction AVG time:")
		print("hours:"..Total_hrs/cnt)
		print("Minutes:"..Total_min/cnt)
		print("seconds:"..Total_sec/cnt)
		print("Mil - seconds:"..Total_mls/cnt)
		
		
		