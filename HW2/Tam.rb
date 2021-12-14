require 'io/console'
require 'bundler'
Bundler.setup
require 'htmlgem'

class Pet

  def initialize(name)
    @name = name
    @life = 20 #жизнь
    @healthy = 100 #здоровье
    @anger = 10 # злость
    @tired = 10 # усталость
    @enjoy = 2 #  Он наслаждается
    @hungry = { v: 0.0, t: Time.now }
    @sad = 10.0
  end

  attr_reader :healthy, :tired, :enjoy, :anger, :life, :hungry, :sad, :name

  def food
    puts "#{@name} has breackfast."
    stepByStep(hungry: -5, enjoy: 3)
  end

  def berate
    puts "Вы ругаете #{@name}."
    stepByStep(hungry: 5, enjoy: -7)
  end

  def takeToTheVet
    puts "Доктор осматривает #{@name}."
    stepByStep(hungry: 5, enjoy: -7, healthy: 5)
  end

  def walk
    stepByStep(hungry: 5, enjoy: 4)
  end

  def readingABook
    puts "Вы читаете сказку #{@name}"
    stepByStep(hungry: 4, enjoy: 5)
  end

  def cleaningTheRoom
    puts "Вы убираете в комнате #{@name}"
    stepByStep(hungry: 7, enjoy: -3, anger: 2)
  end

  def tellStories
    stepByStep(hungry: 5, enjoy: 4)
  end

  def jumpingThroughPuddles
    puts "Вы прыгаете по лужах #{@name}"
    stepByStep(hungry: 5, enjoy: 4, healthy: -3)
  end

  def goToGrooming
    puts "Вы идете на стрижку #{@name}"
    stepByStep(hungry: 7, enjoy: 4)
  end

  def putToBed
    puts "Вы укладываете спать #{@name}"
    stepByStep(hungry: 10, enjoy: 7, healthy: 10)
  end

  def hungry?
    @hungry[:v] > 7
  end

  def death?
    @life <= 0 || @healthy <= 0
  end

  def text
    if death?
      'я умер.......'
    elsif @healthy < 10
      'я умираю!!!'
    elsif hungry?
      'покорми меня'
    end
  end

  def say
    puts text
  end

  def status
    result = text
    instance_variables.each { |el| result += "\n#{el}: #{instance_variable_get(el)}" }
    result
  end

  private

  def stepByStep(properties)
    @healthy += properties[:healthy] if properties.key?(:healthy)
    if properties.key?(:hungry)
      @hungry[:v] += properties[:hungry]
      @hungry[:t] = Time.now
    end
    if @hungry[:v] > 5 || @hungry[:v] < -30
      @healthy -= 10
    end
    @enjoy += properties[:enjoy] if properties.key?(:enjoy)
    @healthy -= 1
    @life -= 1
  end
end

class Dog < Pet
  def text
    result = 'гав-гав'
    result += "\n#{super} - (по-собачьи)" unless super.nil?
    result
  end

  def get_emoji_code
    '&#128054;'
  end
end

class Cat < Pet
  def text
    result = 'мяу-мяу'
    result += "\n#{super} - (по-кошачему)" unless super.nil?
    result
  end

  def get_emoji_code
    '&#128049;'
  end
end

class Pig < Pet
  def text
    result = 'хрю-хрю'
    result += "\n#{super} - (по-свинячему)" unless super.nil?
    result
  end

  def get_emoji_code
    '&#128055;'
  end
end

class Chicken < Pet
  def text
    result = 'ко-ко-ко'
    result += "\n#{super} - (по-куриному)" unless super.nil?
    result
  end

  def get_emoji_code
    '&#128020;'
  end
end

PETS = [Dog, Cat, Pig, Chicken]

def print_main_menu
  Gem.win_platform? ? (system 'cls') : (system 'clear')
  puts 'Нажмите 1, если Вы готовы к выбору животного'
  puts 'Нажмите 0, чтобы выйти с игры'
  puts '🤑'
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
  Gem.win_platform? ? (system 'cls') : (system 'clear')
  PETS.each_with_index { |el, i| puts "#{el} #{i + 1}" }
end

def choosePetType
  loop do
    print_pets
    action = gets.chomp.to_i - 1
    result = PETS[action]
    return result unless result.nil?
  end
end

loop do
  print_main_menu
  case gets.chomp
  when '1'
    break
  when '0'
    exit
  end
end

type = choosePetType
p 'Введите имя животного'
name = gets.chomp
pet = type.new(name)

loop do
  Gem.win_platform? ? (system 'cls') : (system 'clear')
  p pet
  content = "<p>#{pet.get_emoji_code}</p>"
  content += "<p>#{pet.status.gsub! "\n", "</p>\n<p>"}</p>}"
  save_content(content, 'index.html')
  if pet.death?
    pet.say
    exit
  end
  print_pets_menu
  case gets.chomp
  when '1'
    pet.food
  when '2'
    pet.berate
  when '3'
    pet.walk
  when '4'
    pet.takeToTheVet
  when '5'
    pet.readingABook
  when '6'
    pet.cleaningTheRoom
  when '7'
    pet.tellStories
  when '8'
    pet.putToBed
  when '9'
    pet.jumpingThroughPuddles
  when '10'
    pet.goToGrooming
  end
end
