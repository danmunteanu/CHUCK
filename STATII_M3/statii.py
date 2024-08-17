import os

# Get the current directory
current_folder = os.getcwd()

# Current Folder Name
cfn = os.path.basename(os.getcwd())

# List all files in the current directory
files_in_directory = os.listdir(current_folder)

# Filter out only .wav files
wav_files = [file for file in files_in_directory if file.endswith('.wav')]

# Print the names of the .wav files with the desired format
count = 0;
for wav_file in wav_files:
    print(f"\"{wav_file}\" => statii[{count}];")
    count = count + 1