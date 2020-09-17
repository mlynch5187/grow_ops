class GrowCallService

  def ph_conversion(zip)
    response = conn.get("/ph?#{zip}")
    ph_json  = JSON.parse(response.body, symbolize_names: true)
    ph       = ph_json[:properties][:layers][0][:depths][1][:values][:mean].to_f / 10
  end

  private

  def conn
    Faraday.new(url: "#{ENV['GROW_CALLS_API']}")
  end
end
