class HospitalsController < ApplicationController
  # GET /hospitals or /hospitals.json
  def index
   @hospitals = if params[:q].present?
      query = "%#{params[:q]}%"
        @hospitals = HospitalDirectory.where(
            "hospital_name LIKE :query",
            query: query
        )
     else
       default_scope
     end.page(params[:page]).per(20)
  end


  private
  def default_scope
    HospitalDirectory.
        by_state("Andhra Pradesh").
        by_district("Krishna")
  end
end
