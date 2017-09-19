
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_slack-client-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/slack-client/2016-08-25/slack-client-20160825-git.tgz";
        sha256 = "5c263a533f7171f0ce7f4c4de803fe862cee20c7451fa551e80a356d594f6336";
      };
    }
