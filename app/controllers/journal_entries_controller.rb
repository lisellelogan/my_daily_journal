class JournalEntriesController < ApplicationController
    # get journal_entries/new to render form to create new journal entries
    get '/journal_entries/new' do 
        erb :'journal_entries/new'
    end
    # post journal_entries to create new journal entry
    post '/journal_entries' do 
        #create new journal entry and save it to db
        #only want to save entry if it has content
        if !logged_in?
            redirect '/'  
        end
        #only want to create entry if user is logged in
        if params[:content] != ""
            @journal_entry = JournalEntry.crate(params)
        else
            redirect '/journal_entries/new'
        end
    end

    # show route for a journal entry

    # index route for all journal entries
end