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

    all_substrings.each do |substring|
        if substring.length > 1
            repeated_substrings[substring] += 1
        end
    end

    max_count = repeated_substrings.values.max
    repeated_substrings.find { |k, v| v == max_count }.first
  end

  def find_repeated_substring_file(file_path)
    File.open(file_path).read.each_line.map { |line| find_repeated_substring(line) }
  end
end
