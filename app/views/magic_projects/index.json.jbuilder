json.array!(@magic_projects) do |magic_project|
  json.extract! magic_project, :id, :name
  json.url magic_project_url(magic_project, format: :json)
end
