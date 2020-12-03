valid_passwords = []
invalid_passwords = []

puts "Enter option 1 or 2 for the puzzle solution"
type = gets.chomp.to_i
if type < 1 || type > 2
  puts "Sorry, can't handle that type, only allowed value is 1 or 2"
  return
end

File.foreach("input.txt") do |password_line|
  /(?<lower>\d+)-(?<highest>\d+) (?<constraint>.): (?<password>\w+)/ =~
    password_line

  password_object = {
    password: password,
    constraint: constraint,
    limits: "#{lower}-#{highest}"
  }
  if type == 1
    repetitions = password.count(constraint)
    if repetitions < lower.to_i || repetitions > highest.to_i
      invalid_passwords.push(password_object)
    else
      valid_passwords.push(password_object)
    end
  else
    if lower.to_i > password.length || highest.to_i > password.length
      invalid_passwords.push(password_object)
      puts "Length missmatch"
      next
    end
    if password[lower.to_i - 1] == constraint
      if password[highest.to_i - 1] == constraint
        invalid_passwords.push(password_object)
      else
        valid_passwords.push(password_object)
      end
    else
      if password[highest.to_i - 1] == constraint
        valid_passwords.push(password_object)
      else
        invalid_passwords.push(password_object)
      end
    end
  end
end

puts "total valid #{valid_passwords.size}"
