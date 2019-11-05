A0 = {
    "0"   => "101010",
    "1"   => "111111",
    "-1"  => "111010",
    "D"   => "001100",
    "A"   => "110000",
    "!D"  => "001101",
    "!A"  => "110001",
    "-D"  => "001111",
    "-A"  => "110011",
    "D+1" => "011111",
    "A+1" => "110111",
    "D-1" => "001110",
    "A-1" => "110010",
    "D+A" => "000010",
    "D-A" => "010011",
    "A-D" => "000111",
    "D&A" => "000000",
    "D|A" => "010101",
}

A1 = {
    "M"   => "110000",
    "!M"  => "110001",
    "-M"  => "110011",
    "M-1" => "110010",
    "M+1" => "110111",
    "D+M" => "000010",
    "D-M" => "010011",
    "M-D" => "000111",
    "D&M" => "000000",
    "D|M" => "010101",
}

DEST ={
    ""     => "000",
    "M"    => "001",
    "D"    => "010",
    "MD"   => "011",
    "A"    => "100",
    "AM"   => "101",
    "AD"   => "110",
    "AMD"  => "111",
}

JUMP = {
    ""    => "000",
    "JGT" => "001",
    "JEQ" => "010",
    "JGE" => "011",
    "JLT" => "100",
    "JNE" => "101",
    "JLE" => "110",
    "JMP" => "111",
}


class Parser
  attr_reader :line
  attr_reader :v, :a, :c, :dest, :jump, :a_instruction, :c_instruction

  def initialize(line)
    @line = line.strip
  end

  def parse
    return if line.empty?
    return if line.start_with?('//')

    if line.start_with?("@")
      @a_instruction = true
      @v = line[1..-1].to_i.to_s(2).rjust(15, '0')

      return
    end

    # dest=comp;jump
    # // Either the dest or jump fields may be empty.
    # // If dest is empty, the = is omitted;
    # // If jump is empty, the ; is omitted.
    #


    @c_instruction = true
    if line.include?(';')
      @comp, jump = line.split(';')
      @jump = JUMP[jump]
    else
      @jump = JUMP['']
    end

    @comp ||= line

    if @comp.include?("=")
      dest, @comp = @comp.split("=")
      @dest = DEST[dest]
    else
      @dest = DEST['']
    end

    if A0.keys.include?(@comp)
      @a = 0
      @c = A0[@comp]
    end

    if A1.keys.include?(@comp)
      @a = 1
      @c = A1[@comp]
    end
  end
end


file = File.open('./pong/PongL.asm')

file.each_line do |line|
  parser = Parser.new(line)
  parser.parse

  if parser.a_instruction
    # 0 v v v v v v v v v v v v v v v
    puts "0#{parser.v}"
  end

  if parser.c_instruction
    # 1 1 1 a c1 c2 c3 c4 c5 c6 d1 d2 d3 j1 j2 j3
    puts "111#{parser.a}#{parser.c}#{parser.dest}#{parser.jump}"
  end
end

