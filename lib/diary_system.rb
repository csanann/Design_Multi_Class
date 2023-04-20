#file: diary_system.rb

class Diary
    def initialize
        @entries = []
    end

    def add_entry(entry)
        @entries << entry
    end

    def entries
        @entries
    end
end

class DiaryEntry

    attr_reader :title, :content, :phone_numbers

    def initialize(title, content, phone_numbers = [] )
        @title = title
        @content = content
        #map the original array to a new array by using flatten_number method to each element
        #map method iterates over each element in the array
        @phone_numbers = phone_numbers.map { |number| flatten_number(number) }
    end

    private
    #flatten_number method is defined as a private method
    def flatten_number(number)
        #it takes a phone number string as input and uses the gsub method to replace all non-digit char with an empty string ""
        number.gsub(/[^\d]/, '')
    end
end
=begin
class PhoneNumber #since we have updated the phone number above in DairyEntry class, we don't need the belowing class

    attr_reader :phone_numbers

    def initialize(number)
        @number = number
    end
end
=end
class DiaryReader

    attr_reader :diary, :wpm

    def initialize(wpm, diary)
        @wpm = wpm
        @diary = diary
    end

    def find_most_readable_in_time(time)
        #implement the logic to find the most readable entry in the given time
        @phone_numbers = phone_numbers.map { |number| flatten_number(number)}
    end
end

class TaskList
    def initialize
        @tasks = []
    end

    def add_task(task)
        @tasks << task
    end

    def tasks
        @tasks
    end
end

class Task
    attr_reader :title

    def initialize(title)
        @title = title
    end
end

