class RepeatedSubstring
  def enumerate_combinations(string, start_idx)
    end_idx = string.length - 1
    (start_idx..end_idx).map do |i|
        string[start_idx..i]
    end
  end

  def find_repeated_substring(string)
    repeated_substrings = Hash.new { |hash, key| hash[key] = 0 }

    end_idx = string.length - 1
    all_substrings = (0..end_idx).map do |i|
        enumerate_combinations(string, i)
    end.flatten

    min_length = 2
    all_substrings.each do |substring|
        if substring.length >= min_length
            repeated_substrings[substring] += 1
        end
    end

    # a repeated substring can only be a subset of the entire string
    max_length = string.length - 1
    find_longest_repeated_substring(repeated_substrings, max_length)
  end

  def find_longest_repeated_substring(repeated_substrings, max_length)
    longest_length = max_length.step(0, -1).find do |l|
        of_length = repeated_substrings.select { |k, v| k.length == l }
        max_count = of_length.values.max
        !max_count.nil? && max_count > 1
    end

    longest_string_set = repeated_substrings.select { |k, v| k.length == longest_length }
    max_count = longest_string_set.values.max
    longest_string_set.find { |k, v| v == max_count }.first
  end

  def find_repeated_substring_file(file_path)
    File.open(file_path).read.each_line.map { |line| find_repeated_substring(line) }
  end
end
