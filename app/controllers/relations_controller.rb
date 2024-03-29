class RelationsController < ApplicationController
  before_filter :get_character
  def get_character
    @character ||= Character.find(params[:character_id])
  end
  # GET /relations
  # GET /relations.json
  def index
    @relations = @character.relations

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @relations }
    end
  end

  # GET /relations/1
  # GET /relations/1.json
  def show
    @relation = Relation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @relation }
    end
  end

  # GET /relations/new
  # GET /relations/new.json
  def new
    @relation = @character.relations.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @relation }
    end
  end

  # GET /relations/1/edit
  def edit
    @relation = Relation.find(params[:id])
  end

  # POST /relations
  # POST /relations.json
  def create
    @relation = @character.relations.new(params[:relation])

    respond_to do |format|
      if @relation.save
        format.html { redirect_to [@character,@relation], notice: 'Relation was successfully created.' }
        format.json { render json: @relation, status: :created, location: @relation }
      else
        format.html { render action: "new" }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /relations/1
  # PUT /relations/1.json
  def update
    @relation = Relation.find(params[:id])

    respond_to do |format|
      if @relation.update_attributes(params[:relation])
        format.html { redirect_to [@character, @relation], notice: 'Relation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relations/1
  # DELETE /relations/1.json
  def destroy
    @relation = Relation.find(params[:id])
    @relation.destroy

    respond_to do |format|
      format.html { redirect_to character_relations_url(@character) }
      format.json { head :ok }
    end
  end
end
