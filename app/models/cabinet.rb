class Cabinet < ActiveRecord::Base
  belongs_to :user
  belongs_to :folder
  has_attached_file :uploaded_file,:url => "/cabinets/get/:id" ,:path => "public/uploads/:id/:basename.:extension"

  validates_attachment_size :uploaded_file, :less_than => 10.megabytes
  validates_attachment_presence :uploaded_file
  do_not_validate_attachment_file_type :uploaded_file

  def file_size
    uploaded_file_file_size
  end


end
