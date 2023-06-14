class ApplicationController < ActionController::API
    
    include ActionController::RequestForgeryProtection
    
    protect_from_forgery with: :exception # csrf
    before_action :snake_case_params, :attach_authenticity_token
    
    rescue_from StandardError, with: :unhandled_error
    rescue_from ActionController::InvalidAuthenticityToken,
        with: :invalid_authenticity_token

    # returns the User whose session_token attribute matches the token provided in the session cookie
    def current_user
        @current_user || User.find_by(session_token: session[:session_token])
    end

    # takes a User instance and resets their session token. The new token is stored in the session cookie.
    def login!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user 
    end

    # resets the session token of the current_user and clears session token from session cookie
    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil 
        @current_user = nil 
    end

    def logged_in?
        !!current_user
    end

    # renders a message of "Unauthorized" with a 401 status if there is no current_user/
    # add as a before_action callback for any controller actions that require a logged-in user.
    def require_logged_in
        #not going to redirect, just send a json error message
        if !logged_in
            render json: {message: ["Must be logged in"]}, status: unauthorized
        end
    end

    def require_logged_out
        if logged_in?
            render json: {errors: ["Must be logged out"]}, status: 403
        end
    end

    def test
        if params.has_key?(:login) #checks if params hash has key ":login"
            login!(User.first) #if so, call the login! method, passing in User.first
        elsif params.has_key?(:logout) #checks if params hash has key ":logout"
            logout! #if so, call the logout! method
        end

        if current_user 
            #if current_user exists, renders JSON response containing id, username, session_token
            render json: { user: current_user.slice('id', 'email', 'session_token') }
        else
            render json: ['No current user']
        end
    end
    
    private
    def snake_case_params
        params.deep_transform_keys!(&:underscore)
    end

    def attach_authenticity_token
        headers["X-CSRF-Token"] = masked_authenticity_token(session)
    end

    def invalid_authenticity_token
        render json: { message: 'Invalid authenticity token' }, 
            status: :unprocessable_entity
    end
    
    def unhandled_error(error)
        if request.accepts.first.html?
            raise error
        else
            @message = "#{error.class} - #{error.message}"
            @stack = Rails::BacktraceCleaner.new.clean(error.backtrace)
            render 'api/errors/internal_server_error', status: :internal_server_error
            
            logger.error "\n#{@message}:\n\t#{@stack.join("\n\t")}\n"
        end
    end

end
