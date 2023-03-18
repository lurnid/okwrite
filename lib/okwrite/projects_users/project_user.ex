defmodule OKWrite.ProjectsUsers.ProjectUser do
  @moduledoc """
  UserProject module
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "projects_users" do
    field :role, :string

    belongs_to :project, OKWrite.Projects.Project, primary_key: true
    belongs_to :user, OKWrite.Accounts.User, primary_key: true

    timestamps()
  end

  @required_fields [:role, :user_id, :project_id]
  @roles ~w(Maintainer)
  def changeset(project_user, attrs \\ %{}) do
    project_user
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> validate_inclusion(:role, @roles)
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:project_id)
    |> unique_constraint(
        [:user, :project],
        name: :project_id_user_id_unique_index,
        message: "Already Exists"
    )
  end
end
