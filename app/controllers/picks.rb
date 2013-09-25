PadrinoFootballPool::App.controllers :picks do
  get :index do
    @picks = Pick.all()
    @weeks = Week.all()
    @teams = Team.all()
    render 'picks/index'
  end

  get :show do
    @pick = Pick.get(params[:id])
    render 'picks/show'
  end

end
