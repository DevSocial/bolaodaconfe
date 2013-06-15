# encoding: utf-8

if Pointing.count == 0
  puts 'POINTINGS'
  pointings = []
  pointings << Pointing.create(
    [
      { :name => 'Acertou na mosca', :point => 10 },
      { :name => 'Corneteiro! Pelo menos acertou quem ganhou', :point => 5 },
      { :name => 'Que fase! Só acertou o número de bolas dentro', :point => 3 },
      { :name => 'Lamentável! você precisa assistir mais futebol, oh cabeção!', :point => 0 }
    ], :without_protection => true
  )
end

if Team.count == 0
  puts 'TEAMS'
  teams = []
  teams << Team.create(
    [
      { :name => 'Brasil', :flag => 'BRA.png' },
      { :name => 'Espanha', :flag => 'ESP.png' },
      { :name => 'Itália', :flag => 'ITA.png' },
      { :name => 'Japão', :flag => 'JPN.png' },
      { :name => 'México', :flag => 'MEX.png' },
      { :name => 'Nigéria', :flag => 'NGA.png' },
      { :name => 'Taiti', :flag => 'TAH.png' },
      { :name => 'Uruguai', :flag => 'URU.png' }
    ], :without_protection => true
  )
end

if Match.count == 0
  puts 'MATCHES'
  matches = []
  matches << Match.create(
    [
      { :group => 'A',
        :date => Time.zone.local(2013, 06, 15, 16, 00), 
        :locale => "Brasília", 
        :team1 => Team.find_by_name('Brasil'),
        :team2 => Team.find_by_name('Japão') },

      { :group => 'A',
        :date => DateTime.strptime("16/06/2013 16:00", "%d/%m/%Y %H:%M"), 
        :locale => "Rio de Janeiro", 
        :team1 => Team.find_by_name('México'),
        :team2 => Team.find_by_name('Itália') },
        
      { :group => 'A',
        :date => DateTime.strptime("19/06/2013 16:00", "%d/%m/%Y %H:%M"), 
        :locale => "Fortaleza", 
        :team1 => Team.find_by_name('Brasil'),
        :team2 => Team.find_by_name('México') },
        
      { :group => 'A',
        :date => DateTime.strptime("19/06/2013 19:00", "%d/%m/%Y %H:%M"), 
        :locale => "Recife", 
        :team1 => Team.find_by_name('Itália'),
        :team2 => Team.find_by_name('Japão') },
        
      { :group => 'A',
        :date => DateTime.strptime("22/06/2013 16:00", "%d/%m/%Y %H:%M"), 
        :locale => "Salvador",
        :team1 => Team.find_by_name('Itália'),
        :team2 => Team.find_by_name('Brasil') },
        
      { :group => 'A',
        :date => DateTime.strptime("22/06/2013 16:00", "%d/%m/%Y %H:%M"), 
        :locale => "Belo Horizonte", 
        :team1 => Team.find_by_name('Japão'),
        :team2 => Team.find_by_name('México') },
        
      { :group => 'B',
        :date => DateTime.strptime("16/06/2013 19:00", "%d/%m/%Y %H:%M"), 
        :locale => "Recife", 
        :team1 => Team.find_by_name('Espanha'),
        :team2 => Team.find_by_name('Uruguai') },
        
      { :group => 'B',
        :date => DateTime.strptime("17/06/2013 16:00", "%d/%m/%Y %H:%M"), 
        :locale => "Belo Horizonte", 
        :team1 => Team.find_by_name('Taiti'),
        :team2 => Team.find_by_name('Nigéria') },
        
      { :group => 'B',
        :date => DateTime.strptime("20/06/2013 16:00", "%d/%m/%Y %H:%M"), 
        :locale => "Rio de Janeiro", 
        :team1 => Team.find_by_name('Espanha'),
        :team2 => Team.find_by_name('Taiti') },
        
      { :group => 'B',
        :date => DateTime.strptime("20/06/2013 19:00", "%d/%m/%Y %H:%M"), 
        :locale => "Salvador", 
        :team1 => Team.find_by_name('Nigéria'),
        :team2 => Team.find_by_name('Uruguai') },
        
      { :group => 'B',
        :date => DateTime.strptime("23/06/2013 16:00", "%d/%m/%Y %H:%M"), 
        :locale => "Fortaleza", 
        :team1 => Team.find_by_name('Nigéria'),
        :team2 => Team.find_by_name('Espanha') },
        
      { :group => 'B',
        :date => DateTime.strptime("23/06/2013 16:00", "%d/%m/%Y %H:%M"), 
        :locale => "Recife", 
        :team1 => Team.find_by_name('Uruguai'),
        :team2 => Team.find_by_name('Taiti') }
=end
    ], :without_protection => true
  )
end
