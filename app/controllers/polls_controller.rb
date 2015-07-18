class PollsController < ApplicationController
  before_action :authenticate_user!

  def index
    @polls = Poll.all
  end
end
