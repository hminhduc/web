module ApplicationHelper

  def current_url(new_params)
    # i merge curent url with csv format.
    # link to change to <%= link_to "name link", current_url(:format => :csv)%>
    url_for :params => params.merge(new_params)
  end

end
