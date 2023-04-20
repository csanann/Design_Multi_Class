#file: diary_system_spec.rb

require_relative 'diary_system'

#write unit tests for Diary class
RSpec.describe Diary do
    #unit for DiaryEntry class
    describe DiaryEntry do
        let(:entry) { DiaryEntry.new("Dance with Jan", "Have some fun", ["+44-077-89889898"])}

        it 'has a title' do
            expect(entry.title).to eq("Dance with Jan")
        end

        it 'has content' do
            expect(entry.content).to eq("Have some fun")
        end

        it 'has phone numbers' do
            expect(entry.phone_numbers).to eq(["+44-077-89889898"])
        end
    end
        
    #uni tests for PhoneNumber class

    #unit tests for Diaryreader class
    describe DiaryReader do
        let(:diary) { Diary.new }
        let(:entry) { DiaryEntry.new("Dance with Jan", "Have some fun") }
        let(:reader) { DiaryReader.new(200, diary) }

        it 'has a diary' do
            expect(reader.diary).to eq(diary)
        end

        it 'has words per minute' do
            expect(reader.wpm).to eq(200)
        end

    #unit tests for TaskList class
    describe TaskList do
        let(:task_list) { TaskList.new }
        let(:task) { Task.new("Buy groceries") }

        it 'addds a task' do
            task_list.add_task(task)
            expect(task_list.tasks).to eq([task])
        end

    #unit tests for Task class
    describe Task do
        let(:task) { Task.new("buy groceries") }

        it 'has a title' do
            expect(task.title).to eq("Buy groceries")
        end
    end
end
