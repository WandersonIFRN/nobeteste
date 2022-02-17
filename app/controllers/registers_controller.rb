class RegistersController < ApplicationController
  before_action :authenticate_user!, except: %i[ index ]
  before_action :set_register, only: %i[ show edit update destroy ]

  # GET /registers or /registers.json
  def index
    @registers = current_user.register.all.filter_by_registermensal(params[:month_year])
    @registermensal = current_user.register.group_by_month(:created_at, format: '%B %Y').count
#  @highlights = Register.filter_register(params[:session])
  end

  # GET /registers/1 or /registers/1.json
  def show
  end

  # GET /registers/new
  def new
    @register = current_user.register.new
  end

  # GET /registers/1/edit
  def edit
  end

  # POST /registers or /registers.json
  def create
    @register = current_user.register.new(register_params)
    
    if @register.valor 
      if @register.tipo=='Deposito'
        @register.saldo = current_user.saldo + @register.valor
        current_user.saldo += @register.valor
        current_user.save
      end
      if @register.tipo=='Saque' or @register.tipo=='Transferencia'
        if  @register.tipo=='Transferencia'
          @usuario = User.find(@register.transferir)
          @usuario.saldo += @register.valor
          @usuario.save
          @registerRecebedor = @register
          @registerRecebedor.user_id = @usuario.id
          @registerRecebedor.saldo = @usuario.saldo + @registerRecebedor.valor
          #@registerRecebedor.save
          @register.saldo = current_user.saldo - @register.valor
          current_user.saldo -= @register.valor
          current_user.save
        else
          @register.saldo = current_user.saldo - @register.valor
          current_user.saldo -= @register.valor
          current_user.save
        end
      end
    end

    respond_to do |format|
      if @register.save
        format.html { redirect_to register_url(@register), notice: "Register was successfully created." }
        format.json { render :show, status: :created, location: @register }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registers/1 or /registers/1.json
  def update
    respond_to do |format|
      if @register.update(register_params)
        format.html { redirect_to register_url(@register), notice: "Register was successfully updated." }
        format.json { render :show, status: :ok, location: @register }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1 or /registers/1.json
  def destroy
    @register.destroy

    respond_to do |format|
      format.html { redirect_to registers_url, notice: "Register was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def register_params
      params.require(:register).permit(:tipo, :descricao, :valor, :transferir)
    end
end
