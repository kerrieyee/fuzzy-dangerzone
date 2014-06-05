class Dictionary
  attr_accessor :root
  def initialize(text)
    @text = parse_text(text.downcase)
    @root = Node.new(@text[0])
  end

  def parse_text(text)
    text.gsub(/[^a-z0-9\s]/i, '').split(' ')
  end

  def print_tree(root=@root)
    print_tree(root.left) if root.left
    puts root.value
    print_tree(root.right) if root.right
  end

  def digest
    length = @text.length
    @text.each_with_index do |word, index|
      if index < length
        following_word = @text[index + 1]
        root = create_or_add_to_node(word)
        root.following_array << following_word
      end
      # traverse through dictionary
      # if word exists add following word to array of values
      # if word doesn't exist then create node and add following word to array of values
      # if last word don't add to following array
    end
  end

  def build_text(n_words)
  end

  def create_or_add_to_node(word)
    root = @root
    what_am_i_doing = nil

    until word == root.value
      if word < root.value && root.left != nil
        root = root.left
      elsif word > root.value && root.right != nil
        root = root.right
      else
        what_am_i_doing = word > root.value ? "right" : "left"
        break
      end
    end

    if what_am_i_doing
      root.send("#{what_am_i_doing}=", Node.new(word))
    else
      root
    end
  end

  def insert_into_following_array

  end

  private

  def search
    #if we don't find it we insert_node
    #if we do find it node.increment, node.insert
  end
  #Markov Patterns

  def insert_node(word)
    Node.new(word)
  end


end

class Node
  attr_accessor :left, :right, :value, :following_array

  def initialize(word)
    @count = 0
    @following_array = []
    @value = word
    @right = nil
    @left = nil
  end

  def increment
    @count += 1
  end

  def insert_into_following_array(word)
    @following_array << word
  end
end

text = "You shall find of the king a husband, madam; you,
sir, a father: he that so generally is at all times
good must of necessity hold his virtue to you; whose
worthiness would stir it up where it wanted rather
than lack it where there is such abundance."
list_text = text.gsub(/[^a-z0-9\s]/i, '').split(' ')
first_sentence = "You shall find of the king a husband"

d = Dictionary.new(first_sentence)
d.digest
p d.print_tree()
