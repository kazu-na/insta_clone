class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  mount_uploader :image_name, ImageUploader
  validates :image, presence: true
  validate  :image_size
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  private

    # アップロードされた画像のサイズをバリデーションする
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "5MB未満でなければなりません")
      end
    end
end
