# Coding: UTF-8
require 'parallel'
require 'date'

times = 100000000
thread_number = 4
puts "#{times}回ループします"

charlist = ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a)

starttime = Time.now
startmin = starttime.min
startsec = starttime.sec
startusec = starttime.usec
startmsec = (startusec / 1000.0).round
puts "start : #{startmin}:#{startsec}.#{startmsec}"

list = Array.new()
for i in 1..thread_number
	list.push(i)
end

Parallel.map(list, :in_threads => thread_number) do |name|
  for count in (times / thread_number).times
    charlist.sample(10)
  end
  puts "Thread#{name} completed!"
end

endtime = Time.now
endmin = endtime.min
endsec = endtime.sec
endusec = endtime.usec
endmsec = (endusec / 1000.0).round
puts "end : #{endmin}:#{endsec}.#{endmsec}"

margin = endtime - starttime
marginmin = (margin / 60).truncate
marginsec = (margin - (marginmin * 60))
puts "margin : #{marginmin}:#{marginsec}"
