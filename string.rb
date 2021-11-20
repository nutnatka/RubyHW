=begin
MyString="...Ты можешь сказать это снова..."
puts MyString
puts MyString
puts "Приветик, как Вас зовут?"
name=gets
puts "Вас зовут "+name+",? Какое прекрасное имя!"
puts "Рада познакомится с Вами "+name+"! :)"
puts "Приветик, как Вас зовут?"
name=gets.chomp
puts "Вас зовут "+name+",? Какое прекрасное имя!"
puts "Рада познакомится с Вами "+name+"! :)"
puts "Добрый день, подскажите Ваше имя?"
name=gets.chomp
puts"также, подскажите Ваше отчество, пожалуйста?"
patronymik=gets.chomp
puts"и подсажите Вашу фамилию?"
surname=gets.chomp
puts "Очень приятно с Вами познакомиться "+name+" "+patronymik+" "+surname+"!"
=end
=begin
puts "Назовите Ваше самое любимое число?" 
number=gets.chomp
puts number+" Какое замечательное число!"
var1 = number.to_i
var1 += 1 #var1 = var1 + 1
puts "Позвольте также предложить Вам число "+var1.to_s+". Я думаю, оно даже лучше!"
=end
=begin
puts "Добрый день, подскажите Ваше имя?"
name=gets.chomp
puts"Tакже, подскажите Ваше отчество, пожалуйста?"
patronymik=gets.chomp
puts"И подсажите Вашу фамилию?"
surname=gets.chomp
s1="А Вы знаете, что Ваше имя состоит c "
s2=" символов?"
n= name.length+patronymik.length+surname.length
puts s1+n.to_s+s2
puts "А Вы знаете, что Ваше имя состоит c "+ (name.length+patronymik.length+surname.length).to_s+" символов?"
=end 
=begin
puts "Что Вы от меня хотите?"
answer=gets.chomp
puts "Что значит "+answer+"? Ви уволены!"
puts "Вопросы еще будут?"
question=gets.chomp
puts "Что значит "+question+"? Ви уволены!"
=end

name = ""
while name == "" do
    puts "Добрый день, подскажите Ваше имя?"
    name = gets.chomp

end
puts "Рада познакомится с Вами "+name+"! :)"


=begin
begin
    puts "Добрый день, подскажите Ваше имя?"
    name = gets.chomp
end while name == ""

puts "Рада познакомится с Вами "+name+"! :)"
=end

=begin
name = ""

until name != ""
    puts "Добрый день, подскажите Ваше имя?"
    name = gets.chomp
end
=end

    