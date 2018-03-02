require 'factory_bot'
require 'faker'

namespace :check_list_engine do
  desc 'Seed data for an audit'
  task seed_audit_data: :environment do

    def create_available_components
      available_components = [
          {title: 'Title', has_photo: false},
          {title: 'Choices', has_photo: false},
          {title: 'Section', has_photo: false},
          {title: 'Photo', has_photo: true},
          {title: 'Date', has_photo: false},
          {title: 'Address', has_photo: false},
          {title: 'Text', has_photo: false},
          {title: 'Signature', has_photo: true},
          {title: 'Yes/No', has_photo: false}
      ]

      available_components.each do |component|
        CheckListEngine::AvailableComponent.new(component).save!
      end

    end

    def get_component_id(title)
      CheckListEngine::AvailableComponent.find_by_title(title).id
    end

    def create_pest_audit
      audit_type = CheckListEngine::AuditType.new title: Faker::Lorem.sentence
      audit_type.save!

      pest_audit_components = [
          { title: 'Title', position: 1, available_component_id: get_component_id('Title'), audit_type_id: audit_type.id, is_mandatory: false },
          { title: 'Customers Address', position: 2, available_component_id: get_component_id('Address'), audit_type_id: audit_type.id, is_mandatory: false },
          { title: 'Date of visit', position: 3, available_component_id: get_component_id('Date'), audit_type_id: audit_type.id, is_mandatory: false},
          { title: 'Kind of pest', position: 7, available_component_id: get_component_id('Text'), audit_type_id: audit_type.id, choices: 'Rat, Mouse, Squirrel, Flea', is_mandatory: false},
          { title: 'Description of the problem', position: 4, available_component_id: get_component_id('Text'), audit_type_id: audit_type.id, is_mandatory: false },
          { title: 'Customer signature', position: 5, available_component_id: get_component_id('Signature'), audit_type_id: audit_type.id, is_mandatory: false},
          { title: 'Work carried out', position: 6, available_component_id: get_component_id('Text'), audit_type_id: audit_type.id, is_mandatory: false},
          { title: 'Photo', position: 7, available_component_id: get_component_id('Photo'), audit_type_id: audit_type.id, is_mandatory: false}
      ]

      pest_audit_components.each do |component|
        CheckListEngine::AuditTypeComponent.new(component).save!
      end

    end



    def create_rental_house_audit
      audit_type = CheckListEngine::AuditType.new title: 'Inspection of a rented house by a landlord'
      audit_type.save!

      rental_house_audit_components = [
          { title: 'Property Address', position: 1, available_component_id: get_component_id('Address'), audit_type_id: audit_type.id, is_mandatory: false },
          { title: 'Date of visit', position: 2, available_component_id: get_component_id('Date'), audit_type_id: audit_type.id, is_mandatory: false},
          { title: 'General impression', position: 3, available_component_id: get_component_id('Title'), audit_type_id: audit_type.id, is_mandatory: false },
          { title: 'Boiler serviced ?', position: 5, available_component_id: get_component_id('Yes/No'), audit_type_id: audit_type.id, is_mandatory: false},
          { title: 'Buildings insurance in place ?', position: 6, available_component_id: get_component_id('Yes/No'), audit_type_id: audit_type.id, is_mandatory: false},
          { title: 'Photo', position: 7, available_component_id: get_component_id('Photo'), audit_type_id: audit_type.id, is_mandatory: false},
          { title: 'Maintainance work needed', position: 8, available_component_id: get_component_id('Title'), audit_type_id: audit_type.id, is_mandatory: false },
          { title: 'Inspecting agents signature', position: 9, available_component_id: get_component_id('Signature'), audit_type_id: audit_type.id, is_mandatory: false},
      ]

      rental_house_audit_components.each do |component|
        CheckListEngine::AuditTypeComponent.new(component).save!
      end

    end

    def dump_audits
      CheckListEngine::AuditType.all.each do |audit|
        puts "----------- Audit: #{audit.title} -------------"

        audit.audit_type_components.order(:position).each do |c|
          puts "  #{c.title} (a #{c.available_component.title})"
        end
      end
    end

    CheckListEngine::AuditTypeComponent.delete_all
    CheckListEngine::AuditType.delete_all
    CheckListEngine::AvailableComponent.delete_all

    create_available_components

    create_pest_audit
    create_rental_house_audit

    dump_audits
  end
end
