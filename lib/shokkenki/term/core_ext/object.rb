require_relative '../string_term'

class Object

  def to_shokkenki_term
    Shokkenki::Term::StringTerm.new self.to_s
  end

end