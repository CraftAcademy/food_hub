module OmniAuthFixtures
    def self.facebook_response
        {provider: 'facebook',
         uid: 10205522242159630,
         info:
             {email: 'thomas@craftacademy.se',
              name: 'Thomas Ochman',
              image: 'http://graph.facebook.com/v2.6/10205522242159630/picture'},
         credentials:
             {token:
                  'EAAXC253O740BANfJYLjz2LCzT1UcfuEsoHpZBMAifdiud8sulF2LIfjDy5BeGiNPEPQjUn7xpvAu0neqnGeoCAvCU2KIucyP5sYNQDaDtCj06UmOF2POEq8ZAajS2zaQ4B7uIIRgv4p3wlACmh9f9MsMnDZB6gZD',
              expires_at: 1517839337,
              expires: true},
         extra:
             {raw_info:
                  {name: 'Thomas Ochman', email: 'thomas@craftacademy.se', id: '10205522242159630'}}}
    
      end
end