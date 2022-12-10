# frozen_string_literal: true

module Profile
  # It groups notes by date
  class DateGroupedNotesService
    def initialize(user_id)
      self.user_id = user_id
      self.base = base_scope
      self.grouped = {}
    end

    def call
      today
      yesterday
      this_week

      grouped
    end

    private

    def base_scope
      Note.includes(board: :user).where(boards: { user_id: })
    end

    def today
      grouped[:today] =
        base.where('notes.created_at >= ? AND notes.created_at <= ?',
                   Time.zone.now.beginning_of_day,
                   Time.zone.now.end_of_day)
    end

    def yesterday
      grouped[:yesterday] =
        base.where('notes.created_at >= ? AND notes.created_at <= ?',
                   Time.zone.now.beginning_of_day - 1.day,
                   Time.zone.now.end_of_day - 1.day)
    end

    def this_week
      grouped[:this_week] =
        base.where('notes.created_at >= ? AND notes.created_at <= ?',
                   Time.zone.now.beginning_of_week,
                   Time.zone.now.end_of_week)
    end

    attr_accessor :user_id, :grouped, :base
  end
end
