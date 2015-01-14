namespace :translate_posts do
  desc "Translate the posts state to English (from spanish)"
  task states: :environment do
    translations = {
      "perdido"     => "lost",
      "encontrado"  => "found",
      "adopcion"    => "adoption"
    }

    Post.all.each do |post|
      state = post.state
      post.update_attribute(:state, translations[state]) if translations[state]
    end
  end

  desc "Translate the posts animal_type to English (from spanish)"
  task animal_types: :environment do
    translations = {
      "perro" => "dog",
      "gato"  => "cat"
    }

    Post.all.each do |post|
      animal_type = post.animal_type
      post.update_attribute(:animal_type, translations[animal_type]) if translations[animal_type]
    end
  end

  desc "Translate the posts status"
  task status: :environment do
    translations = {
      "Activo" => "active",
      "Cerrado" => "closed"
    }

    Post.all.each do |post|
      status = post.status
      post.update_attribute(:status, translations[status]) if translations[status]
    end

  end
end