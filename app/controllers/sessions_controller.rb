class SessionsController < ApplicationController
    def new
        @users = User.new
      # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    end

    def create
        # cherche s'il existe un utilisateur en base avec l’e-mail
        user = User.find_by(email: params[:email])
        # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
        if user && user.authenticate(params[:password_digest])
          log_in(user)
          helpers.remember(user)
          redirect_to "/"
        else
          puts "CA MARCHE PAS !"
          flash.now[:danger] = 'Invalid email/password combination'
          redirect_to new_session_path
        end
      end

    def destroy
      puts "**************************"
      user = User.find_by(id: session[:user_id])
      log_out(user)
      redirect_to new_session_path
    end
end