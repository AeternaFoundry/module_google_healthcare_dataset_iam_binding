resource "google_healthcare_dataset_iam_binding" "healthcare_dataset_iam_bindings" {
  for_each = var.healthcare_dataset_iam_bindings

  dataset_id = each.value.dataset_id
  members    = each.value.members
  role       = each.value.role

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

