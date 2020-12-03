valid_passwords = []
invalid_passwords = []

File.foreach("input.txt") do |password_line|
  /(?<lower>\d+)-(?<highest>\d+) (?<constraint>.): (?<password>\w+)/ =~
    password_line
  repetitions = password.count(constraint)
  if repetitions < lower.to_i || repetitions > highest.to_i
    invalid_passwords.push({
      password: password,
      constraint: constraint,
      limits: "#{lower}-#{highest}"
    })
  else
    valid_passwords.push({
      password: password,
      constraint: constraint,
      limits: "#{lower}-#{highest}"
    })
  end
end

puts "total valid #{valid_passwords.size}"
