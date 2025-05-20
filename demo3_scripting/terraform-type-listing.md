# Azure Resource Types to Terraform AzureRM Resources Mapping

## Compute
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.Compute/virtualMachines | azurerm_virtual_machine (legacy)<br>azurerm_linux_virtual_machine<br>azurerm_windows_virtual_machine |
| Microsoft.Compute/availabilitySets | azurerm_availability_set |
| Microsoft.Compute/diskEncryptionSets | azurerm_disk_encryption_set |
| Microsoft.Compute/disks | azurerm_managed_disk |
| Microsoft.Compute/galleries | azurerm_shared_image_gallery |
| Microsoft.Compute/galleries/images | azurerm_shared_image |
| Microsoft.Compute/galleries/images/versions | azurerm_shared_image_version |
| Microsoft.Compute/hostGroups | azurerm_dedicated_host_group |
| Microsoft.Compute/hostGroups/hosts | azurerm_dedicated_host |
| Microsoft.Compute/images | azurerm_image |
| Microsoft.Compute/proximityPlacementGroups | azurerm_proximity_placement_group |
| Microsoft.Compute/virtualMachineScaleSets | azurerm_virtual_machine_scale_set (legacy)<br>azurerm_linux_virtual_machine_scale_set<br>azurerm_windows_virtual_machine_scale_set |
| Microsoft.Compute/snapshots | azurerm_snapshot |
| Microsoft.Compute/sshPublicKeys | azurerm_ssh_public_key |
| Microsoft.ContainerService/managedClusters | azurerm_kubernetes_cluster |

## Networking
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.Network/virtualNetworks | azurerm_virtual_network |
| Microsoft.Network/virtualNetworks/subnets | azurerm_subnet |
| Microsoft.Network/networkInterfaces | azurerm_network_interface |
| Microsoft.Network/networkSecurityGroups | azurerm_network_security_group |
| Microsoft.Network/networkSecurityGroups/securityRules | azurerm_network_security_rule |
| Microsoft.Network/publicIPAddresses | azurerm_public_ip |
| Microsoft.Network/loadBalancers | azurerm_lb |
| Microsoft.Network/loadBalancers/backendAddressPools | azurerm_lb_backend_address_pool |
| Microsoft.Network/loadBalancers/probes | azurerm_lb_probe |
| Microsoft.Network/loadBalancers/rules | azurerm_lb_rule |
| Microsoft.Network/routeTables | azurerm_route_table |
| Microsoft.Network/routeTables/routes | azurerm_route |
| Microsoft.Network/applicationGateways | azurerm_application_gateway |
| Microsoft.Network/privateDnsZones | azurerm_private_dns_zone |
| Microsoft.Network/privateDnsZones/virtualNetworkLinks | azurerm_private_dns_zone_virtual_network_link |
| Microsoft.Network/privateEndpoints | azurerm_private_endpoint |
| Microsoft.Network/virtualNetworkGateways | azurerm_virtual_network_gateway |
| Microsoft.Network/virtualNetworkGatewayConnections | azurerm_virtual_network_gateway_connection |
| Microsoft.Network/localNetworkGateways | azurerm_local_network_gateway |
| Microsoft.Network/expressRouteCircuits | azurerm_express_route_circuit |
| Microsoft.Network/bastionHosts | azurerm_bastion_host |
| Microsoft.Network/vpnGateways | azurerm_vpn_gateway |
| Microsoft.Network/firewallPolicies | azurerm_firewall_policy |
| Microsoft.Network/azureFirewalls | azurerm_firewall |
| Microsoft.Network/natGateways | azurerm_nat_gateway |
| Microsoft.Network/frontdoors | azurerm_frontdoor |
| Microsoft.Network/dnsZones | azurerm_dns_zone |
| Microsoft.Network/privateLinkServices | azurerm_private_link_service |

## Storage
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.Storage/storageAccounts | azurerm_storage_account |
| Microsoft.Storage/storageAccounts/blobServices | azurerm_storage_account_blob_properties |
| Microsoft.Storage/storageAccounts/blobServices/containers | azurerm_storage_container |
| Microsoft.Storage/storageAccounts/fileServices | azurerm_storage_account_file_properties |
| Microsoft.Storage/storageAccounts/fileServices/shares | azurerm_storage_share |
| Microsoft.Storage/storageAccounts/queueServices | azurerm_storage_account_queue_properties |
| Microsoft.Storage/storageAccounts/queueServices/queues | azurerm_storage_queue |
| Microsoft.Storage/storageAccounts/tableServices | azurerm_storage_account_table_properties |
| Microsoft.Storage/storageAccounts/tableServices/tables | azurerm_storage_table |

## Databases
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.Sql/servers | azurerm_sql_server (legacy)<br>azurerm_mssql_server |
| Microsoft.Sql/servers/databases | azurerm_sql_database (legacy)<br>azurerm_mssql_database |
| Microsoft.Sql/servers/elasticPools | azurerm_sql_elasticpool (legacy)<br>azurerm_mssql_elasticpool |
| Microsoft.Sql/managedInstances | azurerm_mssql_managed_instance |
| Microsoft.Sql/managedInstances/databases | azurerm_mssql_managed_database |
| Microsoft.DBforPostgreSQL/servers | azurerm_postgresql_server (legacy)<br>azurerm_postgresql_flexible_server |
| Microsoft.DBforPostgreSQL/servers/databases | azurerm_postgresql_database |
| Microsoft.DBforMySQL/servers | azurerm_mysql_server (legacy)<br>azurerm_mysql_flexible_server |
| Microsoft.DBforMySQL/servers/databases | azurerm_mysql_database |
| Microsoft.DBforMariaDB/servers | azurerm_mariadb_server |
| Microsoft.DBforMariaDB/servers/databases | azurerm_mariadb_database |
| Microsoft.DocumentDB/databaseAccounts | azurerm_cosmosdb_account |
| Microsoft.DocumentDB/databaseAccounts/sqlDatabases | azurerm_cosmosdb_sql_database |
| Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers | azurerm_cosmosdb_sql_container |
| Microsoft.Cache/redis | azurerm_redis_cache |

## Web
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.Web/serverfarms | azurerm_app_service_plan (legacy)<br>azurerm_service_plan |
| Microsoft.Web/sites | azurerm_app_service (legacy)<br>azurerm_linux_web_app<br>azurerm_windows_web_app |
| Microsoft.Web/sites/slots | azurerm_app_service_slot (legacy)<br>azurerm_linux_web_app_slot<br>azurerm_windows_web_app_slot |
| Microsoft.Web/staticSites | azurerm_static_site |
| Microsoft.Web/hostingEnvironments | azurerm_app_service_environment |
| Microsoft.Web/certificates | azurerm_app_service_certificate |
| Microsoft.Web/connectionGateways | azurerm_api_connection_gateway |
| Microsoft.Web/connections | azurerm_api_connection |

## Identity & Access Management
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.ManagedIdentity/userAssignedIdentities | azurerm_user_assigned_identity |
| Microsoft.Authorization/roleAssignments | azurerm_role_assignment |
| Microsoft.Authorization/roleDefinitions | azurerm_role_definition |
| Microsoft.Authorization/policyDefinitions | azurerm_policy_definition |
| Microsoft.Authorization/policySetDefinitions | azurerm_policy_set_definition |
| Microsoft.Authorization/policyAssignments | azurerm_policy_assignment |
| Microsoft.KeyVault/vaults | azurerm_key_vault |
| Microsoft.KeyVault/vaults/secrets | azurerm_key_vault_secret |
| Microsoft.KeyVault/vaults/keys | azurerm_key_vault_key |
| Microsoft.KeyVault/vaults/certificates | azurerm_key_vault_certificate |

## Analytics & IoT
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.DataFactory/factories | azurerm_data_factory |
| Microsoft.DataFactory/factories/pipelines | azurerm_data_factory_pipeline |
| Microsoft.DataFactory/factories/datasets | azurerm_data_factory_dataset_* |
| Microsoft.DataFactory/factories/linkedservices | azurerm_data_factory_linked_service_* |
| Microsoft.Synapse/workspaces | azurerm_synapse_workspace |
| Microsoft.Synapse/workspaces/sqlPools | azurerm_synapse_sql_pool |
| Microsoft.Synapse/workspaces/sparkPools | azurerm_synapse_spark_pool |
| Microsoft.StreamAnalytics/streamingjobs | azurerm_stream_analytics_job |
| Microsoft.StreamAnalytics/streamingjobs/inputs | azurerm_stream_analytics_stream_input_* |
| Microsoft.StreamAnalytics/streamingjobs/outputs | azurerm_stream_analytics_output_* |
| Microsoft.IoTHub/IotHubs | azurerm_iothub |
| Microsoft.Devices/provisioningServices | azurerm_iothub_dps |
| Microsoft.TimeSeriesInsights/environments | azurerm_iot_time_series_insights_* |
| Microsoft.EventHub/namespaces | azurerm_eventhub_namespace |
| Microsoft.EventHub/namespaces/eventhubs | azurerm_eventhub |
| Microsoft.EventHub/namespaces/eventhubs/consumergroups | azurerm_eventhub_consumer_group |
| Microsoft.ServiceBus/namespaces | azurerm_servicebus_namespace |
| Microsoft.ServiceBus/namespaces/queues | azurerm_servicebus_queue |
| Microsoft.ServiceBus/namespaces/topics | azurerm_servicebus_topic |
| Microsoft.ServiceBus/namespaces/topics/subscriptions | azurerm_servicebus_subscription |

## AI & Machine Learning
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.CognitiveServices/accounts | azurerm_cognitive_account |
| Microsoft.MachineLearningServices/workspaces | azurerm_machine_learning_workspace |
| Microsoft.MachineLearningServices/workspaces/computes | azurerm_machine_learning_compute_cluster<br>azurerm_machine_learning_compute_instance |
| Microsoft.BotService/botServices | azurerm_bot_service_* |

## Integration & Messaging
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.Logic/integrationAccounts | azurerm_logic_app_integration_account |
| Microsoft.Logic/workflows | azurerm_logic_app_workflow |
| Microsoft.Logic/integrationServiceEnvironments | azurerm_logic_app_integration_service_environment |
| Microsoft.ApiManagement/service | azurerm_api_management |
| Microsoft.ApiManagement/service/apis | azurerm_api_management_api |
| Microsoft.ApiManagement/service/products | azurerm_api_management_product |
| Microsoft.NotificationHubs/namespaces | azurerm_notification_hub_namespace |
| Microsoft.NotificationHubs/namespaces/notificationHubs | azurerm_notification_hub |

## Monitoring & Management
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.OperationalInsights/workspaces | azurerm_log_analytics_workspace |
| Microsoft.OperationalInsights/workspaces/savedSearches | azurerm_log_analytics_saved_search |
| Microsoft.OperationalInsights/workspaces/dataSources | azurerm_log_analytics_datasource_* |
| Microsoft.Insights/components | azurerm_application_insights |
| Microsoft.Insights/actionGroups | azurerm_monitor_action_group |
| Microsoft.Insights/metricAlerts | azurerm_monitor_metric_alert |
| Microsoft.Insights/activityLogAlerts | azurerm_monitor_activity_log_alert |
| Microsoft.Insights/diagnosticSettings | azurerm_monitor_diagnostic_setting |
| Microsoft.RecoveryServices/vaults | azurerm_recovery_services_vault |
| Microsoft.RecoveryServices/vaults/backupPolicies | azurerm_backup_policy_* |
| Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems | azurerm_backup_protected_* |
| Microsoft.Automation/automationAccounts | azurerm_automation_account |
| Microsoft.Automation/automationAccounts/runbooks | azurerm_automation_runbook |

## Container Registry & Batch
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.ContainerRegistry/registries | azurerm_container_registry |
| Microsoft.ContainerRegistry/registries/webhooks | azurerm_container_registry_webhook |
| Microsoft.Batch/batchAccounts | azurerm_batch_account |
| Microsoft.Batch/batchAccounts/pools | azurerm_batch_pool |
| Microsoft.Batch/batchAccounts/applications | azurerm_batch_application |
| Microsoft.Batch/batchAccounts/certificates | azurerm_batch_certificate |

## Security & Governance
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.Security/securityContacts | azurerm_security_center_contact |
| Microsoft.Security/pricings | azurerm_security_center_subscription_pricing |
| Microsoft.Security/autoProvisioningSettings | azurerm_security_center_auto_provisioning |
| Microsoft.Security/workspaceSettings | azurerm_security_center_workspace |
| Microsoft.Security/assessments | azurerm_security_center_assessment |
| Microsoft.Security/advancedThreatProtectionSettings | azurerm_advanced_threat_protection |

## Resource Groups & Subscriptions
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.Resources/resourceGroups | azurerm_resource_group |
| Microsoft.Resources/deployments | azurerm_resource_group_template_deployment<br>azurerm_subscription_template_deployment<br>azurerm_management_group_template_deployment |
| Microsoft.Resources/tags | azurerm_resource_group_template_deployment (for tag operations) |

## Other Common Resources
| Azure Resource Type | Terraform Resource |
|---------------------|-------------------|
| Microsoft.NetApp/netAppAccounts | azurerm_netapp_account |
| Microsoft.NetApp/netAppAccounts/capacityPools | azurerm_netapp_pool |
| Microsoft.NetApp/netAppAccounts/capacityPools/volumes | azurerm_netapp_volume |
| Microsoft.HDInsight/clusters | azurerm_hdinsight_* |
| Microsoft.Kusto/clusters | azurerm_kusto_cluster |
| Microsoft.Kusto/clusters/databases | azurerm_kusto_database |
| Microsoft.Cdn/profiles | azurerm_cdn_profile |
| Microsoft.Cdn/profiles/endpoints | azurerm_cdn_endpoint |
| Microsoft.Media/mediaservices | azurerm_media_services_account |
| Microsoft.Relay/namespaces | azurerm_relay_namespace |
| Microsoft.SignalRService/SignalR | azurerm_signalr_service |

## Note
This mapping reflects the Azure Provider (azurerm) as of late 2024. Some resource types may have multiple corresponding Terraform resources, especially where newer versions have been introduced (marked with legacy for older resources).

For the most up-to-date and complete mapping, please refer to the [official Terraform AzureRM provider documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs).