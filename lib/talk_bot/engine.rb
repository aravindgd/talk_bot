module TalkBot
	class Engine < ::Rails::Engine
		isolate_namespace TalkBot
		config.generators do |g|
			g.template_engine :haml
		end
	end
end

