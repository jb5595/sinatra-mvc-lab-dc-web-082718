class PigLatinizer

  def piglatinize(input)
    if input.include?(" ")
      @words = input.split(" ").collect do |word|
        piglatinize_word(word)
      end
    return @words.join(" ")
    else
      piglatinize_word(input)
    end
  end

  def piglatinize_word(input, first_run = true)
    if /[AEIOU]/i.match(input[0]) && first_run
      @piglatin = input + "w"
    elsif /[^AEIOU]/i.match(input[0])
      first_run = false
      @piglatin = input[1..input.length] + input[0]
      piglatinize_word(@piglatin, first_run)
    end
    @piglatin + "ay"
  end


end
