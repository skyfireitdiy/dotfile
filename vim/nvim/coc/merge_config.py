import os
import json
import shutil
import hashlib


def merge_json_file(json_file_1, json_file_2, output_file):
    with open(json_file_1, 'r') as f1, open(json_file_2, 'r') as f2:
        data1 = json.load(f1)
        data2 = json.load(f2)

    data1.update(data2)

    with open(output_file, 'w') as out_file:
        json.dump(data1, out_file)


def md5sum(file):
    if not os.path.exists(file):
        return ""
    md5 = hashlib.md5()
    with open(file, 'rb') as f:
        for chunk in iter(lambda: f.read(4096), b""):
            md5.update(chunk)
    return md5.hexdigest()


def main():
    user_config = os.path.join(os.environ["HOME"], ".coc-settings.json")
    sys_config = os.path.join(
        os.environ["HOME"], ".config/nvim/coc/coc-settings.json")
    target_config = os.path.join(
        os.environ["HOME"], ".config/nvim/coc-settings.json")
    hash_sum_config = os.path.join(
        os.environ["HOME"], ".local/share/nvim/coc/config-hash.json")

    user_hash = md5sum(user_config)
    sys_hash = md5sum(sys_config)
    target_hash = md5sum(target_config)

    if os.path.exists(hash_sum_config):
        with open(hash_sum_config, "r") as fp:
            config_hash = json.load(fp)
            if 'user' in config_hash and config_hash['user'] == user_hash and 'sys' in config_hash and config_hash['sys'] == sys_hash and 'target' in config_hash and config_hash['target'] == target_hash:
                print("don't need merge")
                return

    if not os.path.exists(user_config):
        shutil.copy(sys_config, target_config)
    else:
        merge_json_file(sys_config, user_config, target_config)

    user_hash = md5sum(user_config)
    sys_hash = md5sum(sys_config)
    target_hash = md5sum(target_config)
    os.makedirs(os.path.dirname(hash_sum_config), 0o644,  True)
    with open(hash_sum_config, "w") as fp:
        json.dump({"user": user_hash, "sys": sys_hash,
                  "target": target_hash}, fp)
    print("config merged")


if __name__ == '__main__':
    main()
