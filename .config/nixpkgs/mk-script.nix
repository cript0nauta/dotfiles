{ lib, writeTextFile, bash }:

{ name, version, file, interpreter ? "bash", env ? [ ] }:

writeTextFile {
  name = "${name}-${version}";
  executable = true;
  destination = "/bin/${name}";
  text = ''
    for i in ${lib.concatStringsSep " " env}; do
      export PATH="$i/bin:$PATH"
    done

    exec ${interpreter} ${file} $@
  '';
}
