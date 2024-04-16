export type DirectusCollections = {
  accountability?: string | null
  archive_app_filter: boolean
  archive_field?: string | null
  archive_value?: string | null
  collapse: string
  collection: string
  color?: string | null
  display_template?: string | null
  group?: string | DirectusCollections | null
  hidden: boolean
  icon?: string | null
  item_duplication_fields?: unknown | null
  note?: string | null
  preview_url?: string | null
  singleton: boolean
  sort?: number | null
  sort_field?: string | null
  translations?: unknown | null
  unarchive_value?: string | null
}

export type Tasks = {
  title: string
  description?: string
}

export type User = {
  first_name: string
  last_name: string
  email: string
  password: string
}
