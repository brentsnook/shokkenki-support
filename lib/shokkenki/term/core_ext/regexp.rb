require_relative '../regexp_term'

class Regexp

  def to_shokkenki_term
    Shokkenki::Term::RegexpTerm.new self
  end

end