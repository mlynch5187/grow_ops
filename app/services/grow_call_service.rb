class GrowCallService

  def ph_conversion(zip)
    ph = conn.get("/ph?zip=#{zip}")
    ph_json = JSON.parse(ph.body, symbolize_names: true)
    ph_data = ph_json[:properties][:layers][0][:depths][1][:values][:mean].to_f / 10
  end

  private

  def conn
    Faraday.new(url: "http://#{ENV['GROW_CALLS_API']}")
  end
end
