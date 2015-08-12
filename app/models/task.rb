class Task < ActiveRecord::Base
  belongs_to :list
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # validates :title, presence: true
  # validate :start_date_cannot_be_in_the_past,
  #          :due_date_cannot_be_in_the_past, on: :create

  enum status: %w(incomplete complete)

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "can't be in the past")
    end
  end

  def before_today_and_incomplete?
    status == "incomplete" && start_date < Date.today
  end

end
