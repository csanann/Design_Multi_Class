#file: diary_recipe.md
{{Diary}} Multi-Class Planned Design Recipe
1. Describe the Problem
As a user
So that I can record my experiences
I want to keep a regular diary
As a user
So that I can reflect on my experiences
I want to read my past diary entries
As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed
As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary
As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries
2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com
┌─────────────┐
│ Diary       │
│             │
│ - add_entry │
│ - entries   │
└───────┬─────┘
        │
        │ has a list of
        ▼
┌─────────────┐
│ DiaryEntry  │
│             │
│ - title     │
│ - content   │
└───────┬─────┘
        │
        │ has a list of
        ▼
┌─────────────┐
│ PhoneNumber │
│             │
│ - number    │
└─────────────┘

┌──────────────┐
│ DiaryReader  │
│              │
│ - diary      │
│ - wpm        │
│ - find_most_readable_in_time │
└──────────────┘

┌─────────────┐
│ TaskList    │
│             │
│ - add_task  │
│ - tasks     │
└───────┬─────┘
        │
        │ has a list of
        ▼
┌─────────────┐
│ Task        │
│             │
│ - title     │
└─────────────┘


1->class Dairy
def add(entry) is an instance of DiaryEntry
def entries
Return a list of DiaryEntries
2->class DiaryEntry
def initialize(title, contents)
def title
return title
def contents
return contents
3->class PhoneBook
def initialize(diary)is an instance of Diary
def extract_numbers
return a list of strings representing phone numbers
collect across all diary entries
4->class DiaryReader
def initialize(wpm, diary)
wpm represents (how many words the reader can read/minute)
diary is an instance of Diary
def find_most_readable_in_time(time)
return DiaryEntry (readable)
5->class TaskList
def add(task)
def add
return a list of tasks
6->class Task
def initialize(title)
def title
3. Create Examples as Integration Tests
paste>problem, keywords here:
Extract them and outline the rspec.file/s: 

1 
So that I can record my experiences
I want to keep a regular diary
As a user
So that I can reflect on my experiences
I want to read my past diary entries
diary = Diary.new
entry_1 = DiaryEntry.new(“title”, “contents”)
entry_2 = DiaryEntry.new(“title one”, “contents two”)
diary.add(entry_1)
diary.add(entry_2)
expect(diary.entries).to eq [entry_1, entry_2]


2
As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed
diary = Diary.new
reader = DiaryReader.new(2, diary)
entry_1 =

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary
As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries
