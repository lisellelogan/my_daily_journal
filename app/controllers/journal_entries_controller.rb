class JournalEntriesController < ApplicationController

    get '/journal_entries' do 
        if logged_in? 
            all_journal_entries = JournalEntry.all
            @user_journal_entries = all_journal_entries.select{|journal_entry| journal_entry.user == current_user} 
            erb :'/journal_entries/index'
        else  
            redirect '/'
        end
    end

    get '/journal_entries/new' do 
        erb :'journal_entries/new'
    end

    post '/journal_entries' do 
        
        if !logged_in?
            redirect '/'  
        end
    
        if params[:content] != ""
            @journal_entry = JournalEntry.create(date: params[:date], content: params[:content], user_id: current_user.id)
            redirect "/journal_entries/#{@journal_entry.id}"
        else
            flash[:message] = "Unable to create journal entry, no input detected. Please try again."
            redirect '/journal_entries/new'
        end
    end

    get '/journal_entries/:id' do 
        @journal_entry = JournalEntry.find_by(id: params[:id])
        erb :'/journal_entries/show'
    end

    get '/journal_entries/:id/edit' do 
        @journal_entry = JournalEntry.find_by(id: params[:id])
        redirect_if_not_logged_in
        not_authorized_to_edit
        erb :'/journal_entries/edit'
    end

    patch '/journal_entries/:id' do 
        @journal_entry = JournalEntry.find_by(id: params[:id])
        redirect_if_not_logged_in
        not_authorized_to_edit
        @journal_entry.update(date: params[:date], content: params[:content])
        redirect "/journal_entries/#{@journal_entry.id}"
    end

    delete '/journal_entries/:id' do 
        @journal_entry = JournalEntry.find_by(id: params[:id])
        if @journal_entry.user == current_user
            @journal_entry.destroy
            redirect '/journal_entries'
        else
            redirect '/journal_entries'
        end
    end

end