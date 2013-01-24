module ApplicationHelper
  def render_friendship_button_for(user)
      link_to "Add Friend", '#', class: 'btn btn-primary btn-small pull-right'
  end
end
