class PagesController < ApplicationController

  def home
    @organisations = Organisation.all
    @organisation = Organisation.new
  end

end
