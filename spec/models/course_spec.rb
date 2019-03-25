require 'rails_helper'

#to be comment if want transaction(no save state) test
RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = "defined"
end

RSpec.describe Course, type: :model do
    
    it "has none to begin with" do
    expect(Course.count).to eq 0
  end


    it "Create course not Empty" do
      course = Course.create!(:course_name => "test add course name" ,:course_description => "test add course des")
      expect(Course.count).to eq(1)
    end

    it "check course_name must correct" do
      expect(Course.last.course_name).to eq("test add course name")
    end

    it "check course_description must correct" do
      expect(Course.last.course_description).to eq("test add course des")
    end

    it "has none after one was created in a previous example" do
    expect(Course.count).to eq 1
  end
  #to be comment if want transaction(no save state) test
  after(:all) { Course.destroy_all }

    
    it "somethings should work!" do
    a = 0.2
    b = 0.1
    expect(a + b).to eq(0.30000000000000004)
    
  end
end