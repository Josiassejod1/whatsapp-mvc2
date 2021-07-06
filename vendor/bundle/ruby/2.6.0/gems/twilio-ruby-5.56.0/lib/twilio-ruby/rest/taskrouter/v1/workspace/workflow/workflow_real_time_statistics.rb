##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class WorkflowContext < InstanceContext
            class WorkflowRealTimeStatisticsList < ListResource
              ##
              # Initialize the WorkflowRealTimeStatisticsList
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The SID of the Workspace that contains the
              #   Workflow.
              # @param [String] workflow_sid Returns the list of Tasks that are being controlled
              #   by the Workflow with the specified SID value.
              # @return [WorkflowRealTimeStatisticsList] WorkflowRealTimeStatisticsList
              def initialize(version, workspace_sid: nil, workflow_sid: nil)
                super(version)

                # Path Solution
                @solution = {workspace_sid: workspace_sid, workflow_sid: workflow_sid}
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Taskrouter.V1.WorkflowRealTimeStatisticsList>'
              end
            end

            class WorkflowRealTimeStatisticsPage < Page
              ##
              # Initialize the WorkflowRealTimeStatisticsPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [WorkflowRealTimeStatisticsPage] WorkflowRealTimeStatisticsPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of WorkflowRealTimeStatisticsInstance
              # @param [Hash] payload Payload response from the API
              # @return [WorkflowRealTimeStatisticsInstance] WorkflowRealTimeStatisticsInstance
              def get_instance(payload)
                WorkflowRealTimeStatisticsInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    workflow_sid: @solution[:workflow_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Taskrouter.V1.WorkflowRealTimeStatisticsPage>'
              end
            end

            class WorkflowRealTimeStatisticsContext < InstanceContext
              ##
              # Initialize the WorkflowRealTimeStatisticsContext
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The SID of the Workspace with the Workflow to
              #   fetch.
              # @param [String] workflow_sid Returns the list of Tasks that are being controlled
              #   by the Workflow with the specified SID value.
              # @return [WorkflowRealTimeStatisticsContext] WorkflowRealTimeStatisticsContext
              def initialize(version, workspace_sid, workflow_sid)
                super(version)

                # Path Solution
                @solution = {workspace_sid: workspace_sid, workflow_sid: workflow_sid, }
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workflows/#{@solution[:workflow_sid]}/RealTimeStatistics"
              end

              ##
              # Fetch the WorkflowRealTimeStatisticsInstance
              # @param [String] task_channel Only calculate real-time statistics on this
              #   TaskChannel. Can be the TaskChannel's SID or its `unique_name`, such as `voice`,
              #   `sms`, or `default`.
              # @return [WorkflowRealTimeStatisticsInstance] Fetched WorkflowRealTimeStatisticsInstance
              def fetch(task_channel: :unset)
                params = Twilio::Values.of({'TaskChannel' => task_channel, })

                payload = @version.fetch('GET', @uri, params: params)

                WorkflowRealTimeStatisticsInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    workflow_sid: @solution[:workflow_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.WorkflowRealTimeStatisticsContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.WorkflowRealTimeStatisticsContext #{context}>"
              end
            end

            class WorkflowRealTimeStatisticsInstance < InstanceResource
              ##
              # Initialize the WorkflowRealTimeStatisticsInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] workspace_sid The SID of the Workspace that contains the
              #   Workflow.
              # @param [String] workflow_sid Returns the list of Tasks that are being controlled
              #   by the Workflow with the specified SID value.
              # @return [WorkflowRealTimeStatisticsInstance] WorkflowRealTimeStatisticsInstance
              def initialize(version, payload, workspace_sid: nil, workflow_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'longest_task_waiting_age' => payload['longest_task_waiting_age'].to_i,
                    'longest_task_waiting_sid' => payload['longest_task_waiting_sid'],
                    'tasks_by_priority' => payload['tasks_by_priority'],
                    'tasks_by_status' => payload['tasks_by_status'],
                    'total_tasks' => payload['total_tasks'].to_i,
                    'workflow_sid' => payload['workflow_sid'],
                    'workspace_sid' => payload['workspace_sid'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {'workspace_sid' => workspace_sid, 'workflow_sid' => workflow_sid, }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [WorkflowRealTimeStatisticsContext] WorkflowRealTimeStatisticsContext for this WorkflowRealTimeStatisticsInstance
              def context
                unless @instance_context
                  @instance_context = WorkflowRealTimeStatisticsContext.new(
                      @version,
                      @params['workspace_sid'],
                      @params['workflow_sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The SID of the Account that created the resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The age of the longest waiting Task
              def longest_task_waiting_age
                @properties['longest_task_waiting_age']
              end

              ##
              # @return [String] The SID of the longest waiting Task
              def longest_task_waiting_sid
                @properties['longest_task_waiting_sid']
              end

              ##
              # @return [Hash] The number of Tasks by priority
              def tasks_by_priority
                @properties['tasks_by_priority']
              end

              ##
              # @return [Hash] The number of Tasks by their current status
              def tasks_by_status
                @properties['tasks_by_status']
              end

              ##
              # @return [String] The total number of Tasks
              def total_tasks
                @properties['total_tasks']
              end

              ##
              # @return [String] Returns the list of Tasks that are being controlled by the Workflow with the specified SID value
              def workflow_sid
                @properties['workflow_sid']
              end

              ##
              # @return [String] The SID of the Workspace that contains the Workflow.
              def workspace_sid
                @properties['workspace_sid']
              end

              ##
              # @return [String] The absolute URL of the Workflow statistics resource
              def url
                @properties['url']
              end

              ##
              # Fetch the WorkflowRealTimeStatisticsInstance
              # @param [String] task_channel Only calculate real-time statistics on this
              #   TaskChannel. Can be the TaskChannel's SID or its `unique_name`, such as `voice`,
              #   `sms`, or `default`.
              # @return [WorkflowRealTimeStatisticsInstance] Fetched WorkflowRealTimeStatisticsInstance
              def fetch(task_channel: :unset)
                context.fetch(task_channel: task_channel, )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.WorkflowRealTimeStatisticsInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.WorkflowRealTimeStatisticsInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end