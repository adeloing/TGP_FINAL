class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit]
    def new
        @comment = Comment.new
      end
    
      def create
        @comment = Comment.new('gossip_id' => params[:gossip_id], 'content' => params[:content], user: User.find_by(id: session[:user_id]))
        if @comment.save
          flash[:success] = "Comment create !"
          redirect_to '/'
        else
          flash[:notice] = "Comment not add !"
          render '/gossips'
        end
      end
    
      def update
        @comment = Comment.find(params[:id])
        @comment_params = params.permit(:content)
        if @comment.update(@comment_params)
          flash[:success] = "Comment update !"
          redirect_to '/'
        else
          render :edit
        end
      end
    
      def edit
        @comment = Comment.find(params[:id])
      end
    
      def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:notice] = "Comment delete !"
        redirect_to gossips_path
      end
    
      def index
        @comment = Comment.all
      end
    
      def show
        @comment = Comment.find(params[:id])
      end

      private

      def authenticate_user
        unless session[:user_id]
          flash[:danger] = "Please log in."
          redirect_to new_session_path
        end
      end
end