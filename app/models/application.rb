# frozen_string_literal: true

# represents planning applications
class Application < Sequel::Model
  unrestrict_primary_key
  many_to_one :category, key: :app_category
  many_to_one :officer, key: :app_officer
  many_to_one :status, key: :app_status
  many_to_one :agent_alias, key: :app_agent
  many_to_one :parish_string, key: :app_parish

  one_to_many :application_constraints, key: :app_ref
  many_to_many :constraints, left_key: :app_ref, right_key: :name

  def before_validation
    code_year_number = app_ref.split('/')
    self.app_code = code_year_number[0]
    self.app_year = code_year_number[1].to_i
    self.app_number = code_year_number[2].to_i
    self.order = build_order
    self.app_address = build_address
    @constraints_list = constraints_list
    self.app_constraints = breakify_constraints
    super
  end

  def before_save
    DB.transaction do
      create_parent(Category, code: app_category)
      create_parent(Officer, name: app_officer)
      create_parent(Status, name: app_status)
      create_parent(ParishString, string: app_parish)
      create_parent(AgentAlias, name: app_agent)
    end
    super
  end

  def after_save
    add_constraints
  end

  TABLE_COLS = %i[order date_valid app_ref app_code app_status app_address
                  app_description app_applicant app_agent app_officer
                  app_parish app_constraints].freeze

  TABLE_LOVS = %w[Category Code Status].freeze # constraints & parish special

  TABLE_TITLES = %w[Order Date Reference Code Status Address Description
                    Applicant Agent Officer Parish Constraints].freeze

  def self.latest_app_num_for(year)
    where(app_year: year).order(:order).last&.app_number
  end

  def parishes
    parish_string.parishes.map(&:name) # CAN BE MORE THAN ONE!
  end

  private

  def build_order
    app_year * 10_000 + app_number
  end

  def build_address
    fields = [app_house, app_road, app_parish, app_postcode]
    self.app_address = fields.compact.join('<br>')
  end

  def create_parent(klass, opts)
    klass.find_or_create(opts) if opts.values.first
  end

  def constraints_list
    return [] unless app_constraints
    app_constraints.split(', ').sort
  end

  def breakify_constraints
    (list = @constraints_list).empty? ? nil : list.join('<br>')
  end

  def add_constraints
    @constraints_list.each do |c|
      Constraint.find_or_create(con_name: c) # before populating join table
      attributes = { name: c, app_ref: app_ref }
      num_records = DB[:applications_constraints].where(attributes).count
      DB[:applications_constraints].insert(attributes) if num_records.zero?
    end
  end
end
