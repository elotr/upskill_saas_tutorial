class ContactsController < ApplicationController

   def new
      @contact = Contact.new
   end
   
   def create
      
      @contact = Contact.new(contact_params)
      if @contact.save
         name = params[:contact][:name]
         email = params[:contact][:email]
         body = params[:contact][:comments]
         ContactMailer.contact_email(name, email, body).deliver
         
         flash[:success] = "Teade saadetud!"       # flash[:success] - key (html'isapplication bootstrap class'i nimi); "Teade saadetud!" - väärtus
         redirect_to new_contact_path#, notice: "Teade saadetud!"    selle osa asemel vt. eelmine rida
      else
         flash[:danger] = "Kõik väljad peavad olema täidetud!"  #@contact.errors.full_messages.join(", ") <- kuidas muuta ingliskeelset errors'i teksti iga välja kohta ankeedis?
         redirect_to new_contact_path#, notice: "Saatmisel tekkis viga."
      end
      
   end
   
   private
      def contact_params
         params.require(:contact).permit(:name, :email, :comments)      # need v2ljad peavad olema t2idetud
      end
   
end