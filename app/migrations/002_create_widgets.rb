# frozen_string_literal: true

PUNK.migration do
  change do
    create_table :widgets do
      uuid :id, primary_key: true, default: Sequel.function(:gen_random_uuid)
      foreign_key :tenant_id, :tenants, null: false, type: :uuid
      foreign_key :user_id, :users, null: false, type: :uuid
      punk_state :state, null: false, default: 'created'
      String :name, null: false, text: true
      String :icon, text: true
      jsonb :data, default: '{}'
      DateTime :created_at
      DateTime :updated_at
      index [:tenant_id, :user_id]
    end
  end
end
