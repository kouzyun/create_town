class Column < ApplicationRecord
	belongs_to :user

	attachment :column_image
end
