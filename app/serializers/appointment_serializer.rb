class AppointmentSerializer < ActiveModel::Serializer
  attributes :id,
    :patient,
    :physician,
    :diseases,
    :pending

  private

  def patient
    UserSerializer.new(object.patient).as_json
  end

  def physician
    UserSerializer.new(object.physician).as_json
  end
end
