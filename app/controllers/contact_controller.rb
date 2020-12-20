class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to contact_new_path, notice: '送信されました'
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
