#file: diary_integration_spec.rb

require_relative 'diary_system'

RSpec.describe 'Diary System' do
    context 'diary and diary entry' do
        it 'adds diary entries and retrieves them' do
            diary = Diary.new
            entry_1 = DiaryEntry.new("Dance with Jan", "Have some fun", ["+44-077-89889898"])
            entry_2 = DiaryEntry.new("Lunch with Dane", "Business meeting", ["+44-075-89455898"])

            diary.add_entry(entry_1)
            diary.add_entry(entry_2)

            expect(diary.entries).to eq([entry_1, entry_2])
            expect(entry_1.phone_numbers).to eq(["4407789889898"])
            expect(entry_2.phone_numbers).to eq(["4407589455898"])
        end
    end

    #describe 'DiaryReader' do
    describe DiaryReader do
        it 'finds the most readable entry within a given time' do
            diary = Diary.new
            entry_1 = DiaryEntry.new("Dance with Jan", "Short entry", ["+44-077-89889898"])
            entry_2 = DiaryEntry.new("Lunch with Dane", "Long entry with more words", ["+44-075-89455898"])

            diary.add_entry(entry_1)
            diary.add_entry(entry_2)

            reader = DiaryReader.new(60, diary) #60 words/minute
            most_readable_entry = reader.find_most_readable_in_time(1) # 1 minute for time to read

            expect(most_readable_entry).to eq(entry_1)
        end
    end

    #describe 'TaskList' do
    context 'TaskList and Task' do
        it 'adds tasks and retrieves them' do
            task_list = TaskList.new
            task_1 = Task.new("Buy groceries")
            task_2 = Task.new("do laundry")

            task_list.add_task(task_1)
            task_list.add_task(task_2)

            expect(task_list.tasks).to eq([task_1, task_2])
        end
    end

    #describe 'PhoneNumber extraction' do
    context 'PhoneNumber extraction' do
        it 'extracts phone numbers from diary entries' do
            diary = Diary.new
            entry_1 = DiaryEntry.new("Dance with Jan", "Have some fun", ["+44-077-89889898"])
            entry_2 = DiaryEntry.new("Lunch with Dane", "Business meeting", ["+44-075-89455898"])

            diary.add_entry(entry_1)
            diary.add_entry(entry_2)

            phone_numbers = diary.entries.flat_map(&:phone_numbers)

            expect(phone_numbers).to eq(["+44-077-89889898", "+44-075-89455898"])
        end
    end
end