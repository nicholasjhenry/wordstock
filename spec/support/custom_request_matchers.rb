module CustomRequestMatchers
  RSpec::Matchers.define :eq_original_word do |expected|
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

  RSpec::Matchers.define :contain_suggestions do |expected|
    match do |actual|
      suggestions = extract_suggestions_attr(actual)
      suggestions == expected
    end

    failure_message_for_should do |actual|
      suggestions = extract_suggestions_attr(actual)
      "expected suggestions to be '#{expected}', got '#{suggestions}':\n #{actual}"
    end
  end

  RSpec::Matchers.define :contain_error_message do |expected|
    match do |actual|
      message = extract_error_message(actual)
      message == expected
    end

    failure_message_for_should do |actual|
      "expected message: '#{expected}' to be included: #{actual}"
    end

    failure_message_for_should_not do |actual|
      "expected message: '#{expected}' not to be included: #{actual}"
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

  def extract_suggestions_attr(source)
    json = JSON.parse(source)
    JSONSelect('.suggestions').match(json)
  end

  def extract_error_message(source)
    json = JSON.parse(source)
    JSONSelect('.message').match(json)
  end
end


