class ServicesIndex < Chewy::Index
  settings analysis: {
      char_filter: {
        ru: {
          type:      'mapping',
          mappings: ['Ё=>Е', 'ё=>е']
        }
      },

      filter: {
        russian_stop: {
          type: 'stop',
          stopwords: '_russian_',
          ignore_case: true
        }
      },

      analyzer: {
        russian: {
          tokenizer:    'standard',
          char_filter: ['html_strip', 'ru'],
          filter:      ['lowercase', 'russian_stop', 'english_morphology', 'russian_morphology']
        }
      }
    }

  define_type Service.all do
    field :title, analyzer: 'russian', boost: 5
    field :description, analyzer: 'russian', boost: 5
  end
end
