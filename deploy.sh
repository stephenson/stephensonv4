npx tailwindcss -i ./source/stylesheets/site.css -o ./source/stylesheets/out.css

middleman build

echo "Moving files to Synology"
cp -R build/* /Volumes/Niklas/web/www.stephenson.dk

echo "Deploy done"