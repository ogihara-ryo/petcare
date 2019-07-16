json.extract! pet, :id, :user_id, :name, :race, :sex, :birthday, :greeted_on, :note,
              :thumbnail, :color, :created_at, :updated_at
json.url pet_url(pet, format: :json)
