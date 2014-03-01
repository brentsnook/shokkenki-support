require_relative '../date_term'

class Date

  def to_shokkenki_term
    Shokkenki::Term::DateTerm.new self
  end

end