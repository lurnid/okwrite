defmodule OKWrite.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset

  alias OKWrite.Accounts.User

  schema "projects" do
    field :name, :string

    many_to_many :users, User,
      join_through: OKWrite.ProjectsUsers.ProjectUser,
      join_keys: [project_id: :id, user_id: :id],
      unique: true

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
