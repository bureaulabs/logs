# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<% if entry.cover.representable? %>
	<% if entry.category.slug == "websites" %>
		<div class="browser-frame">
			<div class="browser-chrome">
				<i class="browser-chrome-dots"></i>
				<i class="browser-chrome-dots"></i>
				<i class="browser-chrome-dots"></i>
			</div>
			<%= link_to entry.url, target: "_blank", class: "cover" do %>
				<%= image_tag url_for(entry.cover) %>
			<% end %>
		</div>
	<% else %>
		<%= link_to entry.url, target: "_blank", class: "cover" do %>
			<%= image_tag url_for(entry.cover) %>
		<% end %>
	<% end %>
<% end %>