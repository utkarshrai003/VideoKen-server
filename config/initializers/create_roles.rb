
ROLES = ["physician", "patient"]

ROLES.each do |role|
  begin
    Role.find_or_create_by!(name: role)
  rescue Exception => e
    puts "Could not create Role #{role}"
  end
end
