class Post < ApplicationRecord
    belongs_to :user
    belongs_to :collect, optional: true

    validates :title, presence: true
    validates :content, presence: true

    attr_accessor :photo

    PHOTOS = File.join Rails.root, 'public', 'photo_store'
    after_save :save_photo

    def photo=(file_data)
        unless file_data.blank?
            @file_data = file_data
            self.extension = file_data.original_filename.split('.').last.downcase
            puts(self.extension)
        end
    end

    def photo_name
        nombre = File.join PHOTOS, "#{id}.#{extension}"
        nombre.split('/').last.downcase
    end

    def photo_filename
        File.join PHOTOS, "#{id}.#{extension}"
    end

    def photo_path
        "/photo_store/#{id}.#{extension}"
    end

    def has_photo?
        File.exists? photo_filename
    end

    private
    def save_photo
        if @file_data
            FileUtils.mkdir_p PHOTOS
            File.open(photo_filename, 'wb') do |f|
                f.write(@file_data.read)
            end
            @file_data = nil
        end
    end

end
