class Post < ActiveRecord::Base
  attr_accessible :from, :from_email, :headers, :html_body, :text_body, :to_email
end
