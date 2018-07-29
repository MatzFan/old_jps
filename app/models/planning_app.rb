# frozen_string_literal: true

# represents planning applications
class PlanningApp < Sequel::Model
  unrestrict_primary_key
  many_to_one :category, key: :app_category
  many_to_one :officer, key: :app_officer
  many_to_one :status, key: :app_status
  many_to_one :agent_alias, key: :app_agent
  many_to_one :parish_alias, key: :app_parish

  one_to_many :planning_app_constraints, key: :app_ref
  many_to_many :constraints, left_key: :app_ref, right_key: :name

  # def before_validation
  #   code_year_number = app_ref.split('/')
  #   self.app_code = code_year_number[0]
  #   self.app_year = code_year_number[1].to_i
  #   self.app_number = code_year_number[2].to_i
  #   self.order = app_year * 10_000 + app_number
  #   self.app_full_address = build_address
  #   self.app_address_of_applicant = build_address_of_applicant
  #   self.mapped = latitude && longitude
  #   self.geom = set_geom(latitude, longitude) if mapped
  #   self.list_app_constraints = breakify(all_constraints)
  #   super
  # end

  def before_save
    DB.transaction do
      create_parent(Category, code: app_category)
      create_parent(Officer, name: app_officer)
      create_parent(Status, name: app_status)
      create_parent(ParishAlias, name: app_parish)
      create_parent(AgentAlias, name: app_agent)
      create_parish(parish_alias)
    end
    super
  end

  def after_save
    add_constraints
  end

  # # def self.latest_app_num_for(year)
  # #   apps = where(app_year: year).order(:order).last
  # #   apps.respond_to?(:[]) ? apps[:app_number] : nil
  # # end

  private

  def create_parent(klass, opts)
    # klass.find_or_create(opts) if send("app_#{klass.to_s.downcase}".to_sym)
    klass.find_or_create(opts) if opts.values.first
  end

  def create_parish(parish_alias)
    self.parish = parish_alias.parish.name if parish_alias&.parish
  end

  def constraints_list
    app_constraints.split(', ').sort
  end

  def add_constraints
    return unless app_constraints
    constraints_list.each do |c|
      Constraint.find_or_create(name: c) # before populating join table
      attributes = { name: c, app_ref: app_ref }
      num_records = DB[:constraints_planning_apps].where(attributes).count
      DB[:constraints_planning_apps].insert(attributes) if num_records.zero?
    end
  end
end
