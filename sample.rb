class User
  def initialize
    @name = 'taro'
  end

  def getName
    return convertToUpcase(@name)
  end
  private
  def convertToUpcase(name)
    return name.upcase
  end
end

user = User.new
user.getName
