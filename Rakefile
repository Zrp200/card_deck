namespace 'build' do
	task :000 do
		`gem build card.gemspec`
		`git add card-0.0.0.gem`
		`git commit card-0.0.0.gem -m 'Built v0.0.0 gem'`
		`git push`
	end
end