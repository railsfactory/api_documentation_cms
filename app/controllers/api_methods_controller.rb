class ApiMethodsController < ApplicationController
  # GET /api_methods
  # GET /api_methods.xml
  require 'httparty'
  before_filter :authenticate_user!, :except => ['method_desc']
  def index
    @api_methods = params[:id] ? ApiMethod.list_methods(params[:id]) : ApiMethod.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @api_methods }
    end
  end

  # GET /api_methods/1
  # GET /api_methods/1.xml
  def show
    @api_method = ApiMethod.find_by_id(params[:id])
    if request.xhr?
      render :partial => 'method_desc', :layout =>false
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @api_method }
      end
    end
  end

  # GET /api_methods/new
  # GET /api_methods/new.xml
  def new
    @list_id = params[:id] if params[:id]
    @api_method = ApiMethod.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @api_method }
    end
  end

  # GET /api_methods/1/edit
  def edit
    @api_method = ApiMethod.find_by_id(params[:id])
  end

  # POST /api_methods
  # POST /api_methods.xml
  def create
    @list_id = params[:id] if params[:id]
    @api_method = ApiMethod.new(params[:api_method])

    respond_to do |format|

      if @api_method.save
        @api_method.update_attributes(:api_list_id => params[:id])
        if params[:api_list]
          params[:api_list].each_with_index do |f, i|
            @parameter = Parameter.new
            @parameter.api_method_id = @api_method.id
            @parameter.name = params[:api_list]["parameter#{i.to_i+1}"]["name#{i.to_i+1}"]
            @parameter.description = params[:api_list]["parameter#{i.to_i+1}"]["description#{i.to_i+1}"]
            @parameter.validation = params[:api_list]["parameter#{i.to_i+1}"]["validation#{i.to_i+1}"]
            @error = params[:api_list]["parameter#{i.to_i+1}"]["request#{i.to_i+1}"] if params[:api_list]["parameter#{i.to_i+1}"]["request#{i.to_i+1}"]
            @parameter.is_request = params[:api_list]["parameter#{i.to_i+1}"]["request#{i.to_i+1}"] == "on" ? true : false
            @parameter.save
          end
        end
        format.html { redirect_to(@api_method, :notice => 'Api method was successfully created.') }
        format.xml  { render :xml => @api_method, :status => :created, :location => @api_method }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @api_method.errors, :status => :unprocessable_entity }
      end
    end
  end
  def delete_parameter
    @parameter = Parameter.find_by_id(params[:id])
    @parameter.destroy
    respond_to do |format|
      format.html { redirect_to(edit_api_method_path(@parameter.api_method)) }
      format.xml  { head :ok }
    end
  end

  # PUT /api_methods/1
  # PUT /api_methods/1.xml
  def update
    @api_method = ApiMethod.find_by_id(params[:id])
    respond_to do |format|
      if @api_method.update_attributes(params[:api_method])
        if params[:parameter]
          params[:parameter].each_with_index do |f, i|
            @parameter = Parameter.find_by_id(params[:parameter]["parameter#{i}"][:id])
            @parameter.update_attributes(:name => params[:parameter]["parameter#{i}"]["name#{i}"], :description => params[:parameter]["parameter#{i}"]["description#{i}"], :validation => params[:parameter]["parameter#{i}"]["validation#{i}"], :is_request => params[:parameter]["parameter#{i}"]["is_request#{i}"] == "1" ? true : false)
          end
        end
        if params[:api_list]
          params[:api_list].each_with_index do |f,i|
            @parameter = Parameter.new
            @parameter.api_method_id = @api_method.id
            @parameter.name = params[:api_list]["parameter#{i.to_i+1}"]["name#{i.to_i+1}"]
            @parameter.description = params[:api_list]["parameter#{i.to_i+1}"]["description#{i.to_i+1}"]
            @parameter.validation = params[:api_list]["parameter#{i.to_i+1}"]["validation#{i.to_i+1}"]
            @error = params[:api_list]["parameter#{i.to_i+1}"]["request#{i.to_i+1}"] if params[:api_list]["parameter#{i.to_i+1}"]["request#{i.to_i+1}"]
            @parameter.is_request = params[:api_list]["parameter#{i.to_i+1}"]["request#{i.to_i+1}"] == "on" ? true : false
            @parameter.save
          end
        end
        format.html { redirect_to(@api_method, :notice => 'Api method was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @api_method.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /api_methods/1
  # DELETE /api_methods/1.xml
  def destroy
    @api_method = ApiMethod.find_by_id(params[:id])
    @api_method.destroy

    respond_to do |format|
      format.html { redirect_to(api_methods_url) }
      format.xml  { head :ok }
    end
  end

  def method_desc
    @current_user = current_user
    @api = ApiList.order_by_postion
		@api_methods = ApiMethod.order_by_postion
    @api_method = ApiMethod.find_by_id(params[:id])
    @req_parameters = Parameter.params_list(params[:id],true)
    @res_parameters = Parameter.params_list(params[:id],false)
    #render :layout => false
  end

  def apimethod_destroy
    @api_list = ApiMethod.find_by_id(params[:id])
    @api_list.destroy
    respond_to do |format|
      format.html { redirect_to(api_methods_url) }
      format.xml  { head :ok }
    end
  end

  def post_api_request
    hash = ActiveSupport::JSON.decode(params['body'])
    response = HTTParty.post(params[:url], { :body => { :header => { :authentication_token => access_token } }.merge(hash) })
    result = JSON.parse(response.body)
    res = JSON.pretty_generate(result)
    if result['response'] == "success"
      render :json => { :response => res, :status => 'success' }
    elsif response['response'] == "failure"
      render :json => { :response => res, :status => 'failure' }
    else
      render :json => { :response => res, :status => 'success' }
    end
  end
  #~ HTTParty.put(form_url(__method__),{:body=>{:access_token=>access_token}.merge(params)}).parsed_response

  def put_api_request
    hash = ActiveSupport::JSON.decode(params['body'])
    response = HTTParty.put(params[:url], { :body => { :header => { :authentication_token => access_token } }.merge(hash) })
    result = JSON.parse(response.body)
    res = JSON.pretty_generate(result)
    if response['response'] == "success"
      render :json => { :response => res, :status => 'success' }
    elsif response['response'] == "failure"
      render :json => { :response => res, :status => 'failure' }
    else
      render :json => { :response => res, :status => 'success' }
    end
  end

  def get_api_request
    hash = ActiveSupport::JSON.decode(params['body'])
    response = HTTParty.get(params[:url], :body => { :header => { :authentication_token => access_token } })
    result = JSON.parse(response.body)
    res = JSON.pretty_generate(result)
    if response['response'] == "success"
      render :json => { :response => res, :status => 'success' }
    elsif response['response'] == "failure"
      render :json => { :response => res, :status => 'failure' }
    else
      render :json => { :response => res, :status => 'success' }
    end
  end

  def delete_api_request
    hash = ActiveSupport::JSON.decode(params['body'])
    response = HTTParty.delete(params[:url], :body => { :header => { :authentication_token => access_token } }).parsed_response
    res = JSON.pretty_generate(response)
    if response['response'] == "success"
      render :json => { :response => res, :status => 'success' }
    elsif response['response'] == "failure"
      render :json => { :response => res, :status => 'failure' }
    else
      render :json => { :response => res, :status => 'success' }
    end
  end

  private

  def access_token
    access_token  = params[:authentication_token]
  end


end
