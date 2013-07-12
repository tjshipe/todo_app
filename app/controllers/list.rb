get '/dashboard' do
  if current_user
    erb :dashboard
  else
    redirect '/'
  end
end

get '/list/new' do
  erb :new_list
end

post '/list/create' do
  current_user.lists.create(params[:list])
  redirect '/dashboard'
end

get '/list/:id' do
  @list = find_list(params[:id])
  erb :show_list
end

get '/list/:id/new_task' do
  @list = find_list(params[:id])
  erb :create_task
end

post '/:id/task/create' do
  @list = find_list(params[:id])
  @list.tasks.create(name: params[:task][:name], completed: 0)
  redirect "/list/#{@list.id}"
end

get '/list/:list_id/:task_id/delete' do
  list = find_list(params[:list_id])
  list.tasks.find(params[:task_id]).destroy
  redirect "/list/#{params[:list_id]}"
end
