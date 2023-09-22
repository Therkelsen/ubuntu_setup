#setup input
cat << 'EOF' > ~/.inputrc
"\e[A":history-search-backward
"\e[B":history-search-forward
"\e[1;5C":forward-word
"\e[1;5D":backward-word
"\e[5C":forward-word
"\e[5D":backward-word
"\e\e[C":forward-word
"\e\e[D":backward-word
"\e[1~":beginning-of-line
"\e[4~":end-of-line
"\e[3~":delete-char
"\e[2~":quoted-insert
EOF

bind -f ~/.inputrc

export PATH=$PATH:/data/bazel-watcher/bazel-bin/cmd/ibazel/ibazel_

# alias
alias build_signed_app='bazel build //tools/artifact_builder/artifacts/application:dev_signed_app_bazel --config=remote-clang && cp -f /workspaces/mir/bazel-bin/tools/artifact_builder/artifacts/application/mir_app_bazel.dev.upgrade.signed /workspaces/mir/signed_app.mir'
alias build_signed_platform='bazel build //tools/artifact_builder/artifacts/platform:dev_signed_platform --config=remote-clang && cp -f /workspaces/mir/bazel-bin/tools/artifact_builder/artifacts/platform/mir_platform.dev.upgrade.signed /workspaces/mir/signed_platform.mir'

# add a list of usual commands
commands_array=()
commands_array+=("cd /workspaces/mir/robot/ros/src/platform_abstraction_layer/cameras/physical_test_realsense")
commands_array+=("clear && bazel test :rostest_test_rs2_cam_node :rostest_test_rs2_cam_node_point_clouds --config=remote-clang --test_output=all --cache_test_results=no --test_timeout=300")
commands_array+=("clear && bazel test :rostest_test_rs2_cam_node --config=remote-clang --test_output=all --cache_test_results=no --test_timeout=300")

# delete some commands
grep -v "mir sim attach" ~/.bash_history > tmpfile && mv tmpfile ~/.bash_history

# delete the usual commands and write them again so that they are at the end of the file and not dupe
for i in "${commands_array[@]}"
do
    grep -v "$i" ~/.bash_history > tmpfile && mv tmpfile ~/.bash_history
    echo "$i" >> ~/.bash_history
done
