task :spec do
    puts `rspec --color`
end
namespace 'build' do
    desc "Builds gem version 2.0.1"
    task "201".to_sym do
        `gem build 99_game.gemspec`
        `git add 99_game-2.0.1.gem`
        `git commit 99_game-2.0.1.gem -m "rake build:201"`
        `git push`
    end
