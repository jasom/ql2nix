
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dartsclemailaddress-quicklisp-release-48464635-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dartsclemailaddress/2016-04-21/dartsclemailaddress-quicklisp-release-48464635-git.tgz";
        sha256 = "87e8247c113c0708dc465505b6aca7801af0ab3016c4598e449484ed6df27995";
      };
    }
