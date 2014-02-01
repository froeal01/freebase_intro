FactoryGirl.define do 
	factory :user do |f|
		f.email "test@test.com"
		f.password "testing"
		f.password_confirmation "testing"
	end
end