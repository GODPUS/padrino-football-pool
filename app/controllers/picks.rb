PadrinoFootballPool::App.controllers :picks do
  get :index do
    @picks = Pick.all()
    render 'picks/index'
  end

  get :show do
    @pick = Pick.get(params[:id])
    render 'picks/show'
  end

end
