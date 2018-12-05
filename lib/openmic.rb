class OpenMic

  attr_accessor :location,
                :date,
                :performers

  def initialize(location: "", date: "")
    @location = location
    @date = date
    @performers = []
  end

  def welcome(names = [])
    @performers << names
  end

  def repeated_jokes?
    if @user.jokes.uniq.length == jokes.length
      true
    else
      flase
    end
  end


end
