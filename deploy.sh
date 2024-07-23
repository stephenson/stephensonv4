npx tailwindcss -i ./source/stylesheets/site.css -o ./source/stylesheets/out.css

middleman build

git commit -a -m "New deploy triggered"

git push origin master