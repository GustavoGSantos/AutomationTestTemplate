# frozen_string_literal: true

Dir[File.join(File.dirname(__FILE__), '../Pages/*_page.rb')].sort.each{ |file| require file }

# Module to set the global variables to be used to call the methods in step_definition file
module Pages
  def login
    @login ||= LoginPage.new
  end
end
