class PagesController < ApplicationController
  def home
    @organisations = Organisation.all
  end
end
