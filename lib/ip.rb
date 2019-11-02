require "ip_modules"

def ip_to_num(ip_address)
  array_ip = ip_address.split(".").map(&:to_i)
  integer_in_binary = to_bits(array_ip)
  return binary_to_decimal(integer_in_binary)
end

def num_to_ip(number)
  loops = 32
  binary_array = []
  bits_array = [128, 64, 32, 16, 8, 4, 2, 1]
  final_ip = []
  number_integer = number.to_i
  array_binary = decimal_to_binary(number_integer, loops, binary_array)
  return binary_to_ip(array_binary, bits_array, final_ip).join(".")
end

def decimal_to_binary(array_number, loops, binary_array)
  until loops.zero?
    if array_number >= 2**(loops - 1)
      binary_array << 1
      array_number -= 2**(loops - 1)
    else
      binary_array << 0
    end
    loops -= 1
  end
  return binary_array
end

def binary_to_ip(array_binary, bits_array, final_ip)
  array_binary.each_slice(8) do |slice|
    loop_bits = 0
    to_sum = 0
    slice.each do |digito|
      to_sum += bits_array[loop_bits] if digito == 1
      loop_bits += 1
    end
    final_ip << to_sum
  end
  return final_ip
end
