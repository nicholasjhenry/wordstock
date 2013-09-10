module CustomRequestMatchers
  RSpec::Matchers.define :original_word_eq do |expected|
    match do |actual|
      word = extract_original_attr(actual)
      word == expected
    end

    failure_message_for_should do |actual|
      word = extract_original_attr(actual)
      "expected original word to be '#{expected}', got '#{word}':\n #{actual}"
    end

    failure_message_for_should_not do |actual|
      word = extract_original_attr(actual)
      "expected orignal word not to be '#{word}':\n #{actual}"
    end
  end

  RSpec::Matchers.define :correctly_spelled? do |expected|
    match do |actual|
      attr = extract_correct_attr(actual)
      attr == true
    end

    failure_message_for_should do |actual|
      word = extract_original_attr(actual)
      "expected '#{word}' to be correctly spelled:\n #{actual}"
    end

    failure_message_for_should_not do |actual|
      word = extract_original_attr(actual)
      "expected '#{word}' to be incorrectly spelled:\n #{actual}"
    end
  end

  def extract_original_attr(source)
    json = JSON.parse(source)
    JSONSelect('.original').match(json)
  end

  def extract_correct_attr(source)
    json = JSON.parse(source)
    JSONSelect('.correct').match(json)
  end
end


