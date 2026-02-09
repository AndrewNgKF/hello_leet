# frozen_string_literal: true

module HelloLeet
  COLORS = {
    green: "\e[32m", red: "\e[31m", yellow: "\e[33m", cyan: "\e[36m",
    dim: "\e[2m", bold: "\e[1m", reset: "\e[0m"
  }.freeze

  def self.c(color, text) = "#{COLORS[color]}#{text}#{COLORS[:reset]}"
end
