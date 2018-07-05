class MoviesController < ApplicationController
  before_action :js_authenticate_user!, only: [:like_movie]
  #2 따라서 이 메소드를 만들어서 ajax 요청을 응답하는 처리를 한다. 
  
  before_action :authenticate_user!, except: [:index, :show]
  #1 위 친구가 ajax로 온 요청을 받아도 응답을 하지 못한다.
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  
  def like_movie
    set_like={user_id: current_user.id, movie_id: params[:movie_id]}
    
    
    #만약에 현재 로그인한 유저가 이미 좋아요를 눌렀을 경우
    #해당 Like 인스턴스 삭제
    #새로 누른 경우
    #좋아요 관계 설정
    
    @like = Like.where(set_like)[0]
    if @like.nil?#비어있으면 없다는 뜻, 즉 처음 좋아요 하는 뜻
      puts "좋아요 만들자--------------------"
      @like =  Like.create(set_like)
    else
      @like.destroy
    end
    
    
    puts "좋아요 설정 끝"
  end
  

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    
    @user_likes_movie = Like.where(user_id: current_user.id, movie_id: @movie.id).first if user_signed_in?

  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :genre, :director, :actor, :description, :image_path)
    end
end
