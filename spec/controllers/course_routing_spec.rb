require 'rails_helper'

#RSpec.configure {|c| c.before { expect(controller).not_to be_nil }

RSpec.describe CoursesController, :type => :controller do

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    describe "responds to" do
    it "responds to html by default" do
      post :create, :params => { :course => { :course_name => "Any Name test" } }
      expect(response.content_type).to eq "text/html"
        end

    it "responds to custom formats when provided in the params" do
      post :create, :params => { :course => { :name => "Any Name" }, :format => :json }
      expect(response.content_type).to eq "application/json"
    end
     end
    end
end