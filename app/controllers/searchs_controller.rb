class SearchsController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @how = params["search"]["how"]
    @detas = search_for(@how, @model, @content)
  end

  private
  def match(model, content)
    if model == 'user'
        User.where(name: content)
    elsif model == 'menu'
        Menu.where(name: content)
    end
  end
    #SQLite3::SQLException: near "LKE": syntax error: SELECT "users".* FROM "users" WHERE (name LKE'%') LIKEの部分のスペルミス  
  def forward(model, content)
    if model == 'user'
        User.where("name LIKE?", "%#{content}")
    elsif model == 'menu'
        Menu.where("name LIKE?", "%#{content}")
    end
  end

  def backward(model, content)
    if model == 'user'
        User.where("name LIKE?", "%#{content}")
    elsif model == 'menu'
        Menu.where("menu LIKE?", "%#{content}")
    end
  end

  def partical(model, content)
    if model == 'user'
        User.where("name LIKE?", "%#{content}")
    elsif model == 'menu'
        Menu.where("name LIKE?", "%#{content}")
    end
  end

  def search_for(how, model, content)
    case how
    when 'match'
        match(model, content)
    when 'forward'
        forward(model, content)
    when 'backward'
        backward(model, content)
    when 'partical'
        partical(model, content)
    end
  end
end