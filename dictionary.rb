class Dictionary
  def initialize(text)
    @text = text
  end

  def digest(text)
    #this will create hashes
    #this digest will be in a bst
  end

  def build_text(n_words)
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
  def initialize(word)
    @count = 0
    @following_array = []
    @value = word
  end

  def increment
    @count += 1
  end

  def insert_into_following_array(word)
    @following_array << word
  end
end
