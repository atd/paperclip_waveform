ActiveRecord::Base.connection.create_table :audios, :force => true do |t|
end

ActiveRecord::Base.connection.add_attachment :audios, :file
