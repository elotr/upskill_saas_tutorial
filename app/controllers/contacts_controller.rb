class ContactsController < ApplicationController
   
   def new
      @contact = Contact.new
   end
   
   def create
      
      @contact = Contact.new(contact_params)
      if @contact.save
         flash[:sucess] = "Teade saadetud!"
         redirect_to new_contact_path#, notice: "Teade saadetud!"    selle osa asemel vt. eelmine rida
      else
         flash[:error] = @contact.errors.full_messages.join(", ")
         redirect_to new_contact_path#, notice: "Saatmisel tekkis viga."
      end
      
   end
   
   private
      def contact_params
         params.require(:contact).permit(:name, :email, :comments)
      end
   
end