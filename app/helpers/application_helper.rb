module ApplicationHelper
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
