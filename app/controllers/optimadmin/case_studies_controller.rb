module Optimadmin
  class CaseStudiesController < Optimadmin::ApplicationController
    before_action :set_case_study, only: [:show, :edit, :update, :destroy]

    def index
      @case_studies = CaseStudy.order_by(params[:order])
        .search(params[:search]).page(params[:page]).per(params[:per_page])
    end

    def show
    end

    def new
      @case_study = CaseStudy.new
    end

    def edit
    end

    def create
      @case_study = CaseStudy.new(case_study_params)
      if @case_study.save
        redirect_to_index_or_continue_editing(@case_study)
      else
        render :new
      end
    end

    def update
      if @case_study.update(case_study_params)
        redirect_to_index_or_continue_editing(@case_study)
      else
        render :edit
      end
    end

    def destroy
      @case_study.destroy
      redirect_to case_studies_url, notice: 'Case study was successfully destroyed.'
    end

    private

    def set_case_study
      @case_study = CaseStudy.friendly.find(params[:id])
    end

    def case_study_params
      params.require(:case_study)
            .permit(:title, :image, :summary, :content, :date, :client_id, :remove_image, :remote_image_url, :image_cache)
    end
  end
end