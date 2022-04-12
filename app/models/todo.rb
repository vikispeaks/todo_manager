class Todo < ActiveRecord::Base
  def overdue?
    due_date < Date.today
  end

  def due_today?
    due_date == Date.today
  end

  def due_later?
    due_date > Date.today
  end

  def self.overdue
    all.where("due_date < ?", Date.today)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end

  def to_pleasent_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date.to_fs(:long)} #{todo_text} #{is_completed}"
  end
end
