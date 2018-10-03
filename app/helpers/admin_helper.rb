# frozen_string_literal: true

# duh
module Sinatra
  # sessions helper
  module AdminHelper
    def build_agent_jfsc_table
      titles = %i[name count]
      @titles = titles.map(&:capitalize) << 'Type' << 'Names' << 'Choose'
      agents = DB[:agents_and_aliases].select_map(titles)[0...2] # 2D arr
      @data = data(agents)
    end

    def data(agents)
      agents.inject([]) do |memo, agent|
        # jfsc_names_for(agent.first).each do |e|
          e = {type: 'a', name: 'b'}
          memo << (agent.dup << e[:type] << e[:name] << nil) # 5 element array
          puts memo
        # end
        memo
      end
    end

    def jfsc_names_for(full_name)
      JfscRegistryScraper.new(text: searchify(full_name)).results
    end

    def searchify(full_name)
      full_name.chomp('Limited').strip
    end
  end

  helpers AdminHelper
end


# $.ajax({type: "POST",
#         url: "/agents",
#         data: { id: $("#Shareitem").val() },
#         success:function(result){
#           / $("#sharelink").html(result);
#       }});