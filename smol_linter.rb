# @author ricks

# Run this command to make sure class names are good
print(%x(bin/rails zeitwerk:check))

# Find files modified
# Only works before git add
modified_file_paths = %x(git diff --name-only).split("\n")

# Loop through files, check the syntax and print the status
modified_file_paths.each do |path|
	next if !path.include?('.rb')
	print(%x(ruby -c #{path}))
end