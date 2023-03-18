defmodule OKWrite.Repo.Migrations.AddProjectUserRelation do
  use Ecto.Migration

  def change do
    create table(:projects_users, primary_key: false) do
      add :role, :string
      add :project_id, references(:projects, on_delete: :delete_all), primary_key: true
      add :user_id, references(:users, on_delete: :delete_all), primary_key: true

      timestamps()
    end

    create index(:projects_users, [:project_id])
    create index(:projects_users, [:user_id])
  end
end
