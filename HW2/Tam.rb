require 'io/console'

class Pet

  def initialize(name)
    @name = name
    @life = 100 #жизнь
    @healthy = 10 #здоровье
    @anger = 10 # злость
    @tired = 10 # усталость
    @enjoy = 2  #  Он наслаждается
    @hungry = {v: 0.0, t: Time.now}
    @sad = 10.0
  end

  attr_reader :healthy, :tired, :enjoy, :anger, :life, :hungry, :sad, :name

  def food
    puts "#{@name} has breackfast."
    stepByStep({hungry:-5, enjoy:3})
  end

  def berate
    puts "Вы ругаете #{@name}."
    stepByStep({hungry:5, enjoy:-7})
  end

  def takeToTheVet
    puts "Доктор осматривает #{@name}."
    stepByStep({hungry:5, enjoy:-7, healthy:5})
  end

  def walk
    stepByStep({hungry:5, enjoy:4})
  end

  def readingABook
    puts "Вы читаете сказку #{@name}"
    stepByStep({hungry:4, enjoy:5})
  end

  def cleaningTheRoom
    puts "Вы убираете в комнате #{@name}"
    stepByStep({hungry:7, enjoy:-3, anger:2})
  end

  def tellStoriesb
    stepByStep({hungry:5, enjoy:4})
  end

  def jumpingThroughPuddles
    puts "Вы прыгаете по лужах #{@name}"
    stepByStep({hungry:5, enjoy:4, healthy:-3})
  end

  def goToGrooming
    puts "Вы идете на стрижку #{@name}"
    stepByStep({hungry:7, enjoy:4})
  end

  def putToBed
    puts "Вы укладываете спать #{@name}"
    stepByStep({hungry:10, enjoy:7,healthy:10})
  end

  def hungry?
    @hungry[:v] > 7
  end

  def death?
    @life <= 0
  end

  def say
    if death?
      "я умер......."
    elsif @healthy < 10
      "я умираю!!!"
    elsif hungry?
      "покорми меня"
    end
  end

  private

  def stepByStep(properties)
    @healthy += properties[:healthy] if !properties[:healthy].nil?
    if !properties[:hungry].nil?
      @hungry[:v] += properties[:hungry]
      @hungry[:t] = Time.now
    end
    if @hungry[:v] > 5
      @healthy -= 10
    end
    @enjoy += properties[:enjoy] if !properties[:enjoy].nil?
    @healthy -= 1
    @life -= 1
  end
end

class Dog < Pet
  def say
    puts "гав-гав"
    puts super + " - (по-собачьи)" if !super.nil?
  end
end

class Cat < Pet
  def say
    puts "мяу-мяу"
    puts super + " - (по-кошачему)" if !super.nil?
  end
end

class Pig < Pet
  def say
    puts "хрю-хрю"
    puts super + " - (по-поросячему)" if !super.nil?
  end
end

class Chicken < Pet
  def say
    puts "ко-ко--ко"
    puts super + " - (по-куриному)" if !super.nil?
  end
end

PETS = [Dog, Cat, Pig, Chicken]

def print_main_menu
  Gem.win_platform? ? (system "cls") : (system "clear")
  puts 'Нажмите 1, если Вы готовы к выбору животного'
  puts 'Нажмите 0, чтобы выйти с игры'
end

def print_pets_menu
  puts '1.pet.food'
  puts '2.pet.berate'
  puts '3.pet.walk'
  puts '4.pet.takeToTheVet'
  puts '5.pet.readingABook'
  puts '6.pet.CleaningTheRoom'
  puts '7.pet.tellStories'
  puts '8.pet.jumpingThroughPuddles'
  puts '9.pet.goToGrooming'
  puts '10.pet.putToBed'
end

def print_pets
  Gem.win_platform? ? (system "cls") : (system "clear")
  PETS.each_with_index { |el, i| puts "#{el} #{i + 1}" }
end

def choosePetType
  result = nil
  loop do
    print_pets
    action = gets.chomp.to_i - 1
    result = PETS[action]
    break if !result.nil?
  end
  result
end

loop do
  print_main_menu
  case gets.chomp
  when "1"
    break
  when "0"
    exit
  end
end

type = choosePetType
p 'Введите имя животного'
name = gets.chomp
pet = type.new(name)

loop do
  Gem.win_platform? ? (system "cls") : (system "clear")
  p pet
  if pet.death?
    pet.say
    exit
  end
  print_pets_menu
  case gets.chomp
  when "1"
    pet.food
  when "2"
    pet.berate
  when "3"
    pet.walk
  when "4"
    pet.takeToTheVet
  when "5"
    pet.readingABook
  when "6"
    pet.cleaningTheRoom
  when "7"
    pet.tellStories
  when "8"
    pet.putToBed
  when "9"
    pet.jumpingThroughPuddles
  when "10"
    pet.goToGrooming
  end
end


