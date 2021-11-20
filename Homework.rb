#arr = [10,11,12,13,14,15,16,17,18,19]
=begin
arr.each do |i|
   puts "#{i}"
end
=end
=begin
for i in arr do
    puts "#{i}"
end
=end

#for i in 0...10 do
=begin
for i in 0...arr.length do
    next if !i.even?
    puts "#{i} - #{arr[i]}"
end
=end
#=begin
=begin
arr.each_with_index {|el, i| puts el if i.even?}
arr.each_with_index {|el, i| puts el if !i.even?}
=end
#arr.each

# Дан целочисленный массив. Найти среднее арифметическое его элементов.	
=begin
arr = [10,11,12,13,14,15,16,17,18,19]
n = 0
arr.each do |it|
    n = it + n
end 
z=n/arr.length
puts z 
=end 
     
#Дан целочисленный массив. Найти количество четных элементов.
=begin
arr = [10,11,12,13,14,15,16,17,18,19]
n=0
arr.each {|el| n+=1 if el.even?}
puts n
=end



#Дан целочисленный массив. Найти среднее арифметическое модулей его элементов
=begin
arr = [10,11,12,13,14,15,16,17,18,19]
n = 0
arr.each do |it|
    n = it + n.abs
end 
z=n.abs/arr.length
puts z 
=end
=begin

arr = [10,11,12,13,14,15,16,17,18,19]
n=0
arr.each {|el| n+=1 if !el.even?}
puts n
=end
#Дан целочисленный массив. Заменить все положительные элементы на значение минимального.
=begin
arr = [25,11,-8,4,18,-15,49,36,-25,6,10,-4,58]
min = arr[0]
arr.each { |n| 
    if n< min; min = n end
 }
puts min
arr.each_with_index {|el,i| if el>0; arr[i]=min  end }
puts arr
=end

#Дан целочисленный массив. Упорядочить его по возрастанию
=begin
arr = [25,11,-8,4,18,-15,49,36,-25,6,10,-4,58]
arr =arr.sort
puts arr
=end



#17Дан целочисленный массив. Найти минимальный четный элемент.   
arr = [58,25,11,-8,4,18,-15,49,36,-25,6,10,-4,58,-25]
arr2 = Array.new()
arr.each {|el| if el.even?; arr2.push(el); end}
puts arr2


#18Дан целочисленный массив. Найти минимальный нечетный элемент.
arr = [58,25,11,-8,4,18,-15,49,36,-25,6,10,-4,58,-25]
arr2 = Array.new()
arr.each {|el|if !el.even?;arr2.push(el);end}

#15Дан целочисленный массив. Найти количество минимальных элементов.
arr = [58,25,11,-8,4,18,-15,49,36,-25,6,10,-4,58,-25]
min=arr[0]
count=0
arr.each {|el| if el<min; min=el; end}
arr.each {|el| if el==min; count = count +1; end}
puts count

#16Дано целое число. Найти сумму его цифр.		
n=258
result= 0;
while n>0    
    result = result + n%10;
    n = n/10;    
end
puts result