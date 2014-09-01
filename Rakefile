namespace 'build' do
	task '000'.to_sym do
		`gem build cards.gemspec`
		`git add cards-0.0.0.gem`
		`git commit cards-0.0.0.gem -m Built_0.0.0_gem`
		`git push`
	end
end
