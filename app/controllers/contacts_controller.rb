class ContactsController < ApplicationController

    def new
        @contact = Contact.new
    end

    def create
        contact = Contact.new(contact_params)

        if contact.save
            redirect_to contacts_path
        end
    end

    
    def index
        @contacts =Contact.all
    end

    def show
        @contact = Contact.find(params[:id])
    end

    def edit
        @contact = Contact.find(params[:id])
    end

    def update
        contact = Contact.find(params[:id])
        contact = contact.update(contact_params)
        redirect_to contacts_path(contact)
    end

    def destroy
        contact = Contact.find(params[:id])
        contact.destroy
        redirect_to contacts_path
    end

    private
    def contact_params
        params.require(:contact).permit(:name, :emailaddress, :body)
    end


end
