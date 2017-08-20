class ContactMailer < ActionMailer::Base
   
   default to: 'musajuutuub@gmail.com'
   
   def contact_email(name, email, body)
      @name = name
      @email = email
      @body = body
      mail(from: email, subject: 'Skarabeus kontakt')
   end
   
end