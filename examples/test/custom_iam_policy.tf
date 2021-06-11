# ecs_task_execution_role_custom_policies = [
#   jsonencode(
#     {
#       "Version" : "2012-10-17",
#       "Statement" : [
#         {
#           "Effect" : "Allow",
#           "Action" : [
#             "secretsmanager:GetSecretValue"
#           ],
#           "Resource" : [
#             "arn:aws:secretsmanager:AWS_REGION:AWS_ACC:secret:SECRET_NAME"
#           ]
#         }
#       ]
#     }
#   )
# ]

#This also works

# ecs_task_execution_role_custom_policies = [
#   "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Action\":[\"secretsmanager:GetSecretValue\"],\"Resource\":[\"arn:aws:secretsmanager:AWS_REGION:AWS_ACC:secret:SECRET_NAME\"]}]}"
# ]
