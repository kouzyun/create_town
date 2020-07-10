class RelationshipsController < ApplicationController
	before_action :authenticate_user!
  def follows
  end

  def followers
  end
end
