# encoding: utf-8

if Pointing.count == 0
  puts 'POINTINGS'
  pointings = []
  pointings << Pointing.create(
    [
      { :name => 'Acertou na mosca', :point => 10 },
      { :name => 'Corneteiro! Pelo menos acertou quem ganhou', :point => 5 },
      { :name => 'Que fase! Só acertou meio placar', :point => 3 },
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
        :date => Time.zone.local(2013, 06, 16, 16, 00), 
        :locale => "Rio de Janeiro", 
        :team1 => Team.find_by_name('México'),
        :team2 => Team.find_by_name('Itália') },
        
      { :group => 'A',
        :date => Time.zone.local(2013, 06, 19, 16, 00), 
        :locale => "Fortaleza", 
        :team1 => Team.find_by_name('Brasil'),
        :team2 => Team.find_by_name('México') },
        
      { :group => 'A',
        :date => Time.zone.local(2013, 06, 19, 19, 00), 
        :locale => "Recife", 
        :team1 => Team.find_by_name('Itália'),
        :team2 => Team.find_by_name('Japão') },
        
      { :group => 'A',
        :date => Time.zone.local(2013, 06, 22, 16, 00), 
        :locale => "Salvador",
        :team1 => Team.find_by_name('Itália'),
        :team2 => Team.find_by_name('Brasil') },
        
      { :group => 'A',
        :date => Time.zone.local(2013, 06, 20, 16, 00), 
        :locale => "Belo Horizonte", 
        :team1 => Team.find_by_name('Japão'),
        :team2 => Team.find_by_name('México') },
        
      { :group => 'B',
        :date => Time.zone.local(2013, 06, 16, 19, 00), 
        :locale => "Recife", 
        :team1 => Team.find_by_name('Espanha'),
        :team2 => Team.find_by_name('Uruguai') },
        
      { :group => 'B',
        :date => Time.zone.local(2013, 06, 17, 16, 00), 
        :locale => "Belo Horizonte", 
        :team1 => Team.find_by_name('Taiti'),
        :team2 => Team.find_by_name('Nigéria') },
        
      { :group => 'B',
        :date => Time.zone.local(2013, 06, 20, 16, 00), 
        :locale => "Rio de Janeiro", 
        :team1 => Team.find_by_name('Espanha'),
        :team2 => Team.find_by_name('Taiti') },
        
      { :group => 'B',
        :date => Time.zone.local(2013, 06, 20, 19, 00), 
        :locale => "Salvador", 
        :team1 => Team.find_by_name('Nigéria'),
        :team2 => Team.find_by_name('Uruguai') },
        
      { :group => 'B',
        :date => Time.zone.local(2013, 06, 23, 16, 00), 
        :locale => "Fortaleza", 
        :team1 => Team.find_by_name('Nigéria'),
        :team2 => Team.find_by_name('Espanha') },
        
      { :group => 'B',
        :date => Time.zone.local(2013, 06, 23, 16, 00), 
        :locale => "Recife", 
        :team1 => Team.find_by_name('Uruguai'),
        :team2 => Team.find_by_name('Taiti') }
    ], :without_protection => true
  )
end
