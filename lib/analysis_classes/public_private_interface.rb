class PublicPrivateInterface
  def initialize
    @number_private = 0
    @number_public = 0
  end

  def run(string, classes)
    get_percentages(classes)
    percentage = @number_public.to_f / @number_private
    return {number_public: @number_public, number_private: @number_private, percentage: percentage.round(2)}
  end

  private

  def get_percentages(classes)
    classes.map{|classname|
      @number_private += ((classname.new.private_methods - Object.new.private_methods).length)
      @number_public += ((classname.new.public_methods - Object.new.public_methods).length)}
  end
end
