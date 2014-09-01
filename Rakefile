namespace 'build' do
	task '000'.to_sym do
		`gem build cards.gemspec`
		`git commit cards-0.0.0.gem -m Built_v0.0.0_gem`
		`git push`
	end
end
