# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities)

puts 'TEAMS'
teams = []
teams << Team.create(
  [
    { :name => 'Brasil' },
    { :name => 'Espanha' },
    { :name => 'Itália' },
    { :name => 'Japão' },
    { :name => 'México' },
    { :name => 'Nigéria' },
    { :name => 'Taiti' },
    { :name => 'Uruguai' }
  ], :without_protection => true
)

puts 'MATCHES'
matches = []
matches << Match.create(
  [
    { :date => DateTime.strptime("15/06/2013 16:00", "%d/%m/%Y %H:%M"), 
      :locale => "Brasília", 
      :team1 => Team.find_by_name('Brasil'),
      :team2 => Team.find_by_name('Japão') },
      
    { :date => DateTime.strptime("16/06/2013 16:00", "%d/%m/%Y %H:%M"), 
      :locale => "Rio de Janeiro", 
      :team1 => Team.find_by_name('México'),
      :team2 => Team.find_by_name('Itália') },
      
    { :date => DateTime.strptime("19/06/2013 16:00", "%d/%m/%Y %H:%M"), 
      :locale => "Fortaleza", 
      :team1 => Team.find_by_name('Brasil'),
      :team2 => Team.find_by_name('México') },
      
    { :date => DateTime.strptime("19/06/2013 19:00", "%d/%m/%Y %H:%M"), 
      :locale => "Recife", 
      :team1 => Team.find_by_name('Itália'),
      :team2 => Team.find_by_name('Japão') },
      
    { :date => DateTime.strptime("22/06/2013 16:00", "%d/%m/%Y %H:%M"), 
      :locale => "Salvador",
      :team1 => Team.find_by_name('Itália'),
      :team2 => Team.find_by_name('Brasil') },
      
    { :date => DateTime.strptime("22/06/2013 16:00", "%d/%m/%Y %H:%M"), 
      :locale => "Belo Horizonte", 
      :team1 => Team.find_by_name('Japão'),
      :team2 => Team.find_by_name('México') },
      
    { :date => DateTime.strptime("16/06/2013 19:00", "%d/%m/%Y %H:%M"), 
      :locale => "Recife", 
      :team1 => Team.find_by_name('Espanha'),
      :team2 => Team.find_by_name('Uruguai') },
      
    { :date => DateTime.strptime("17/06/2013 16:00", "%d/%m/%Y %H:%M"), 
      :locale => "Belo Horizonte", 
      :team1 => Team.find_by_name('Taiti'),
      :team2 => Team.find_by_name('Nigéria') },
      
    { :date => DateTime.strptime("20/06/2013 16:00", "%d/%m/%Y %H:%M"), 
      :locale => "Rio de Janeiro", 
      :team1 => Team.find_by_name('Espanha'),
      :team2 => Team.find_by_name('Taiti') },
      
    { :date => DateTime.strptime("20/06/2013 19:00", "%d/%m/%Y %H:%M"), 
      :locale => "Salvador", 
      :team1 => Team.find_by_name('Nigéria'),
      :team2 => Team.find_by_name('Uruguai') },
      
    { :date => DateTime.strptime("23/06/2013 16:00", "%d/%m/%Y %H:%M"), 
      :locale => "Fortaleza", 
      :team1 => Team.find_by_name('Nigéria'),
      :team2 => Team.find_by_name('Espanha') },
      
    { :date => DateTime.strptime("23/06/2013 16:00", "%d/%m/%Y %H:%M"), 
      :locale => "Recife", 
      :team1 => Team.find_by_name('Uruguai'),
      :team2 => Team.find_by_name('Taiti') }
  ], :without_protection => true
)
