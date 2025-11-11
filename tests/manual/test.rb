# Regular comment - should be grey (@comment)

# This is a comment above a class
# It might be marked as @comment.documentation (light_grey)
class MyClass
  # This is a comment above a method
  # It might be marked as @comment.documentation (light_grey)
  def my_method
    # This is a comment inside a method - regular @comment (grey)
    puts "Hello"
  end
end

# Another regular comment
x = 5

##
# RDoc style comment
# This is definitely documentation
class DocumentedClass
  ##
  # RDoc method documentation
  def documented_method
  end
end
