class StudentsController < ApplicationController
  before_action :get_college
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = @college.students #change @college.students
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = @college.students.build #change @college
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = @college.students.build(student_params) #change @college.students

    respond_to do |format|
      if @student.save
        format.html { redirect_to college_students_path(@college), notice: "Student was successfully created." }#change
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to college_student_path(@college), notice: "Student was successfully updated." }#change college_student_path
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to college_students_path(@college), notice: "Student was successfully destroyed." } #change
      format.json { head :no_content }
    end
  end

  private

  def get_college
    @college = College.find(params[:college_id]) #add new
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = @college.students.find(params[:id])#change
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:student_name, :student_id, :college_id)
    end
end
