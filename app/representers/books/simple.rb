class Books::Simple < Books::UltraSimple
  property :author, extend: AuthorRepresenter
end

