require 'linked_list_item'

class LinkedList
  attr_reader :first_item

  def initialize ( *args )
    args.each do | arg |
      add_item arg
    end
  end

  def add_item ( payload )
    next_item = LinkedListItem.new payload

    if @first_item.nil?
      @first_item = next_item
    else
      final_item = @first_item
      until final_item.last?
        final_item = final_item.next_list_item
      end
        final_item.next_list_item = next_item
    end
  end

  def find_item ( n )
    current_item = @first_item

    n.times do
      raise IndexError if current_item.nil?
      current_item = current_item.next_list_item
    end

    current_item
  end

  def get ( n )
    find_item( n ).payload
  end

  def last
    unless @first_item.nil?
      final_item = @first_item
      until final_item.last?
        final_item = final_item.next_list_item
      end
      final_item.payload
    end
  end

  def size
    list_length = 0
    current_item = @first_item

    until current_item.nil?
      current_item = current_item.next_list_item
      list_length += 1
    end

    list_length
  end

  def to_s
    list_items = String.new
    current_item = @first_item

    until current_item === nil
      string = current_item.payload
      list_items << " "
      list_items << "#{string}"
      list_items << "," unless current_item.last?
      current_item = current_item.next_list_item
    end

    "|#{list_items} |"
  end

  def indexOf ( search_var )
    item_index, current_item = 0, @first_item

    return nil if @first_item === nil
    until current_item.payload === search_var
      unless current_item.next_list_item === nil
        current_item = current_item.next_list_item
        item_index += 1
      else
        return nil
      end
    end

    item_index
  end

  # ========= Bonus ========== #

  def [] ( n )
    get n
  end

  def []= ( n, payload )
    find_item( n ).payload = payload
  end

  def remove ( n )

    next_item = @first_item
    prev_item = @first_item

    ( n + 1 ).times do
      raise IndexError if next_item === nil
      next_item = next_item.next_list_item
    end

    if n > 0
      ( n - 1 ).times do
        raise IndexError if prev_item === nil
        prev_item = prev_item.next_list_item
      end
      prev_item.next_list_item = next_item
    else
      @first_item = next_item
    end

  end

      # ========= Sorting Exercise ========== #

  def sorted?
    current_item = @first_item

    until current_item.nil? or current_item.last?
      if current_item > current_item.next_list_item
        return false
      end
      current_item = current_item.next_list_item
    end

    true
  end

  def sort
    current_item = @first_item

    until current_item.nil? or current_item.last?
      if current_item > current_item.next_list_item
        swap_with_next current_item
        self.sort
      end
      current_item = current_item.next_list_item
    end

    self
  end

  def swap_with_next ( current_item )

    current_to_next = current_item.payload
    next_to_current = current_item.next_list_item.payload
    current_item.payload = next_to_current
    current_item.next_list_item.payload = current_to_next

  end

end







