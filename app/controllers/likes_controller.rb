class LikesController < ApplicationController
    before_action :authenticate_user, only: [:create]

    def index
        @likes = Like.all
      # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    end

    def show
      # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    end

    def new
      # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    end

    def create
        @like = Like.new('gossip_id' => params[:gossip_id], user: User.find_by(id: session[:user_id]))
        if @like.save
          flash[:success] = "like given !"
          redirect_to '/'
        else
          flash[:notice] = "like not given !"
          render '/gossips'
        end
    end

    def edit
      # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    end

    def update
      # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
      # pour info, le contenu de ce formulaire sera accessible dans le hash params
      # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    end

    def destroy
      # Méthode qui récupère le potin concerné et le détruit en base
      # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    end

    private

    def authenticate_user
      unless session[:user_id]
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end
end