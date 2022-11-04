class LikesController < ApplicationController
    before_action :authenticate_user, only: [:create]

    def index
        @likes = Like.all
      # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    end

    def new
      @like = Like.new
    end

    def create
        @like = Like.new(gossip: Gossip.find_by(id: session[:gossip_id]), user: User.find_by(id: session[:user_id]))
        if @like.save
          flash[:success] = "like given !"
          redirect_to '/'
        else
          flash[:notice] = "like not given !"
          render '/gossips'
        end
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