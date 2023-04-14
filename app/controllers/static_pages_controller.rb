# frozen_string_literal: true

# This is a Ruby class that defines a controller action for rendering the home page with the current
# user's information as a prop.
class StaticPagesController < ApplicationController
  def home
    render inertia: 'StaticPages/Home', props: { user: current_user }
  end
end
