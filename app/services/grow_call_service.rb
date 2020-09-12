class GrowCallService

  def ph_conversion(zip)
    ph = conn.get("/ph?zip=#{zip}")
  end

  private

  def conn
    Faraday.new(url: "http://#{ENV['GROW_CALLS_API']}")
  end
end
