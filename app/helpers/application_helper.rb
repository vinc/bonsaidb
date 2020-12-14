module ApplicationHelper
  def body_class
    "#{controller_path}/#{action_name}".tr("/", "-")
  end

  def nav_link_class(active: false)
    list = ["nav-link"]
    list << "active" if active
    list.join(" ")
  end

  def version_title(version)
    version.item_type.constantize.find(version.item_id).title
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def version_path(version)
    item = version.item_type.constantize.find(version.item_id)
    polymorphic_path(item, version: version.created_at.to_i)
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def version_author(version)
    User.find(version.version_author)
  end

  def link_to_version_author(version)
    user = User.find(version.version_author)
    link_to(user.username, user)
  end

  def split_list(list)
    list.split(/, ?/)
  end

  def humanize_list(list)
    res = ''
    array = split_list(list)
    array.each_with_index do |item, i|
      if i == 0
        res += item
      elsif i == array.size - 1
        if i == 1
          res += " or #{item}"
        else
          res += ", or #{item}"
        end
      else
        res += ", #{item}"
      end
    end
    res
  end
end
