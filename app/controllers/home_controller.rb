# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end

  def about; end

  def blog; end

  def contact; end

  def cv; end

  private

  def curriculum_vitae
    @curriculum_vitae ||= CurriculumVitae.first
  end
  helper_method :curriculum_vitae

  def resume_hash
    t('attributes', scope: :curriculum_vitae, default: {})
  end
end
