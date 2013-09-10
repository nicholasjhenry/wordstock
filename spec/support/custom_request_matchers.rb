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

  RSpec::Matchers.define :include_error_message do |expected|
    match do |actual|
      messages = extract_error_messages(actual)
      messages.include?(expected)
    end

    failure_message_for_should do |actual|
      messages = extract_error_messages(actual)
      "expected message: '#{expected}' to be present: #{messages}"
    end

    failure_message_for_should_not do |actual|
      messages = extract_error_messages(actual)
      "expected message: '#{expected}' not to be present: #{messages}"
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

  def extract_error_messages(source)
    json = JSON.parse(source)
    JSONSelect('.messages').match(json)
  end
end


