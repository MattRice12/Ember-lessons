# New Ember App
	ember new <name>

# Start Ember Server
	ember s      ---- basic
        rails new rails-api --api     ------ with rails

# Create a route
	ember g route application

# package.json
	ember-cli-babel --- lets you write in ES6 anywhere in your ember app
	ember-cli-data --- helps you talk to the server
	ember-cli-qunit -- for testing

# Other
	.hbs --- basically html with some additional things


# Process:::::
	--- RAILS SIDE ---
	1. rails new <name> --api
	2. rails g resource monster name:string level:integer
	3. MonstersController --> 
		def index
			render json: Monster.all
		end

	4. gem 'active_model_serializers', '~> 0.8.1'
	5. MonsterSerializer -->
		attributes :id, :name, :level
	_______________________________________________
	--- EMBER SIDE ---
	1. ember new <name>
	2. ember g route application (this is the /root route)
	3. ./.ember-cli
		"proxy": "http://localhost:3000"

	4. app/routes/application.js
		import Ember from 'ember';
		
		export default Ember.Route.extend({
			model(){
				return this.store.findAll('monster'); 
			}
		});

	5. app/templates/application.hbs
		<ul>
		{{#each model as |monster|}}
			<li>{{monster.name}} is level {{monster.level}}</li>
		{{/each}}
		</ul>

	6. ember install active-model-adapter
	7. app/adapters/application.js
		import ActiveModelAdapter from 'active-model-adapter';
						
		export default ActiveModelAdapter.extend();

	8. app/models/monster.js
		import DS from 'ember-data';

		export default DS.Model.extent({
			name: DS.attr('string').
			level: DS.attr('number')
		});
