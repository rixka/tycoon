data "aws_iam_policy_document" "assume_role" {
  statement {
    actions   = ["sts:AssumeRole"]
    resources = [
      "${aws_iam_role.read_only.arn}",
      "${aws_iam_role.admin.arn}",
      "${aws_iam_role.super_admin.arn}"
      ]
  }
}

resource "aws_iam_policy" "assume_role" {
  name   = "assume-role"
  policy = "${data.aws_iam_policy_document.assume_role.json}"
}

resource "aws_iam_group_policy_attachment" "assume_role" {
  group      = "${aws_iam_group.super_admins.name}"
  policy_arn = "${aws_iam_policy.assume_role.arn}"
}

resource "aws_iam_group" "super_admins" {
  name = "super-admins"
}
