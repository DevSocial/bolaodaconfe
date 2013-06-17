# encoding: UTF-8

ActiveAdmin.register Post do


  form do |f|
    f.inputs do
      
      f.input :user_id, 
              :label => 'Usuário', 
              :as => :select, 
              :collection => User.all.map{|u| ["#{u.full_name}", u.id]}
              
      f.input :match_id, 
              :label => 'Jogo', 
              :as => :select, 
              :collection => Match.all.map{|m| ["#{m.date} - #{m.team1.name} x #{m.team2.name}", m.id]}
      
      f.input :content
      f.actions
    end
  end


end
