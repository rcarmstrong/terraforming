output "route_table_ids" {
  value = "${aws_route_table.table.*.id}"
}
