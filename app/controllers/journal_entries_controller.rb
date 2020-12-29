class JournalEntriesController < ApplicationController
    # get journal_entries/new to render form to create new journal entries
    get '/journal_entries/new' do 
        erb :'journal_entries/new'
    end

    # post journal_entries to create new journal entry
    post '/journal_entries' do 
        
        #only want to save entry if it has content
        if !logged_in?
            redirect '/'  
        end
        #only want to create entry if user is logged in
        if params[:content] != ""
            @journal_entry = JournalEntry.crate(content: params[:content], user_id: current_user.id)
            redirect "/journal_entries/#{@journal_entry.id}"
        else
            redirect '/journal_entries/new'
        end
    end

    # show route for a journal entry
    get '/journal_entries/:id' do 
        @journal_entry = JournalEntry.find_by(id: params[:id])
        erb :'/journal_entries/show'
    end

    # edit journal entries
    get '/journal_entries/:id/edit' do 
        @journal_entry = JournalEntry.find_by(id: params[:id])
        if logged_in?
            if @journal_entry.user == current_user
                erb :'/journal_entries/edit'
            else  
                redirect "/users/#{current_user.id}"
            end
        else  
            redirect '/'
        end
    end

    #patch 
    patch '/journal_entries/:id' do 
        @journal_entry = JournalEntry.find_by(id: params[:id])
        @journal_entry.update(date: params[:date], content: params[:content])
        redirect "/journal_entries/#{@journal_entry.id}"
    end

    # index route for all journal entries
end