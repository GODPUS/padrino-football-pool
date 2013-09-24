PadrinoFootballPool::Admin.controllers :picks do
  get :index do
    @title = "Picks"
    @picks = Pick.all(:account => current_account)
    render 'picks/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'pick')
    @pick = Pick.new
    render 'picks/new'
  end

  post :create do
    @pick = Pick.new(params[:pick])
    @pick.account = current_account
    
    if @pick.save
      @title = pat(:create_title, :model => "pick #{@pick.id}")
      flash[:success] = pat(:create_success, :model => 'Pick')
      params[:save_and_continue] ? redirect(url(:picks, :index)) : redirect(url(:picks, :edit, :id => @pick.id))
    else
      @title = pat(:create_title, :model => 'pick')
      flash.now[:error] = pat(:create_error, :model => 'pick')
      render 'picks/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "pick #{params[:id]}")
    @pick = Pick.get(params[:id])

    if @pick && @pick.account == current_account
      render 'picks/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'pick', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "pick #{params[:id]}")
    @pick = Pick.get(params[:id])

    if @pick && @pick.account == current_account
      if @pick.update(params[:pick])
        flash[:success] = pat(:update_success, :model => 'Pick', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:picks, :index)) :
          redirect(url(:picks, :edit, :id => @pick.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'pick')
        render 'picks/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'pick', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Picks"
    pick = Pick.get(params[:id])

    if pick && pick.account == current_account
      if pick.destroy
        flash[:success] = pat(:delete_success, :model => 'Pick', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'pick')
      end
      redirect url(:picks, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'pick', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Picks"
    unless params[:pick_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'pick')
      redirect(url(:picks, :index))
    end
    ids = params[:pick_ids].split(',').map(&:strip)
    picks = Pick.all(:id => ids)
    
    if picks.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Picks', :ids => "#{ids.to_sentence}")
    end
    redirect url(:picks, :index)
  end
end
