FactoryBot.define do
	factory :post do
		user_id {"1"}
	    title { "testtitle" }
	    body { "testtesttesttesttest" }
	    image_id { "egergehtb89ywe"}
	   	address { "大阪府1-2-3" }
	   	association :user
  	end
end