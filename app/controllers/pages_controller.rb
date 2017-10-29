class PagesController < ApplicationController
  def index
    @pages = Page.all
    render json: { pages: @pages.as_json(only: [:id, :url]) }
  end

  def show
    @page = Page.find(params[:id])
    render json: { page: @page.as_json(include: :indexes) }
  end

  def create
    @page   = Page.create!(url: params[:page])
    IndexPageJob.perform_later(@page.id)
    render json: { message: 'Your page is being index', page: @page }, status: 202
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    render json: { message: 'Your page has been deleted successfully.', page: @page }
  end
end
