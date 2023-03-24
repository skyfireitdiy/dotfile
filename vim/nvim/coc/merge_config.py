import os
import json
import shutil

def merge_json_file(json_file_1, json_file_2, output_file):
    with open(json_file_1, 'r') as f1, open(json_file_2, 'r') as f2:
        data1 = json.load(f1)
        data2 = json.load(f2)
    
    data1.update(data2)

    with open(output_file, 'w') as out_file:
        json.dump(data1, out_file)

def main():
    user_config = os.path.join(os.environ["HOME"], ".coc-settings.json")
    sys_config = os.path.join(os.environ["HOME"], ".config/nvim/coc/coc-settings.json")
    target_config = os.path.join(os.environ["HOME"], ".config/nvim/coc-settings.json")
    if not os.path.exists(user_config):
        shutil.copy(sys_config, target_config)
        return
    merge_json_file(sys_config, user_config, target_config)

if __name__ == '__main__':
    main()
