# convert ip address to binary
def to_bits(array_ip)
  numero = []
  array_ip.each do |section|
    compare_to_bits(section, numero)
  end
  return numero
end

# loop to compare each block of the ip to one bit
def compare_to_bits(section, numero)
  bits_array = [128, 64, 32, 16, 8, 4, 2, 1]
  bits_array.each do |bit|
    if section >= bit
      numero << 1
      section = section - bit
    else
      numero << 0
    end
  end
  return numero
end

# convert the binary numero to decimal by checking 0s and1s
def binary_to_decimal(integer_in_binary)
  loops = integer_in_binary.length - 1
  to_sum = []
  integer_in_binary.each do |bit|
    to_sum << 2**loops if bit == 1
    loops -= 1
  end
  integer_in_decimal = 0
  to_sum.each { |a| integer_in_decimal += a }
  return integer_in_decimal
end
