module ES
  extend self

  # https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html#_reserved_characters

  CHARS     = %w[ + - = && || > < ! ( ) { } [ ] ^ " ~ * ? : \\ / ]
  OPERATORS = %w[ AND OR NOT ]

  CHARS_PATTERN     = Regexp.new("(#{ CHARS.map { |ch| Regexp.escape(ch) }.join('|') })")
  OPERATORS_PATTERN = Regexp.new("\\b(#{ OPERATORS.join('|') })\\b")

  def escape(s)
    s.gsub(CHARS_PATTERN, '\\\\\1').gsub(OPERATORS_PATTERN, '"\1"')
  end
end
