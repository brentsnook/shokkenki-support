require_relative '../date_time_term'

class Time

  def to_shokkenki_term
    Shokkenki::Term::DateTimeTerm.new self
  end

end