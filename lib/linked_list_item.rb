class LinkedListItem
  include Comparable
  attr_reader :next_list_item
  attr_accessor :payload

  def initialize ( payload )
  	@payload = payload
  end

  def next_list_item= ( linked_list_item )
    raise ArgumentError, "Can't set next_list_item to self" if self === linked_list_item
  	@next_list_item = linked_list_item
  end

  def last?
  	next_list_item.nil?
  end

  def === other_item
    self.object_id == other_item.object_id
  end

  def <=> other
    if self.payload.class == other.payload.class
      return self.payload <=> other.payload
    else
      if self.payload.class == Fixnum
        -1
      elsif self.payload.class == String and other.payload.class == Symbol
        -1
      else
        1
      end
    end
  end

end