# frozen_string_literal: true

# The MarkupParserService class is a Ruby class that tags in a given markup and converts them
# into HTML
class MarkupParserService
  def initialize(markup)
    self.markup = markup
  end

  def call
    parse_markup
  end

  private

  def parse_markup
    markup.gsub!(/(#+)(.*)/) do |match|
      level = match.scan(/#/).count
      content = match.gsub(/#+/, '').strip

      "<h#{level} class='text-#{level}xl font-bold mb-4'>#{content}</h#{level}>"
    end

    markup.gsub!(/(.*)\n?/) do |match|
      content = match.strip

      next if content.empty?

      "<p class='mb-4'>#{content}</p>"
    end

    markup
  end

  attr_accessor :markup
end
