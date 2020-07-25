FactoryBot.define do
	factory :column do
		user_id {"1"}
	    title { "testtitle" }
	    body { "testtesttesttesttest" }
	    column_image_id {"warkgwarger"}
	   	association :user
  	end
end