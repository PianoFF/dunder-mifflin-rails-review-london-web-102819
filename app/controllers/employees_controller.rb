class EmployeesController < ApplicationController
    def index
        @employees=Employee.all 
    end 

    def show
        @employee=Employee.find(params[:id])
    end

    def edit
        @employee=Employee.find(params[:id])
    end

    def update
        @employee=Employee.new(employee_params)

        if @employee.update 
            redirect_to employee_path(@employee)
        else
           
            redirect_to new_employee_path
        end 
    end

    def new
        @employee=Employee.new
    end 

    def create
        @employee=Employee.new(employee_params)

        if @employee.save
            redirect_to employee_path(@employee)
        else
            render :new
        end 
    end 

    private
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url,:dog_id)
    end 
end
