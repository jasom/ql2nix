
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_bordeaux-threads, lisp_maiden-client-entities, lisp_maiden-commands, lisp_maiden-storage, lisp_postmodern,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_maiden-client-entities lisp_maiden-commands lisp_maiden-storage lisp_postmodern  ];
      inherit stdenv;
      systemName = "maiden-chatlog";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_maiden-client-entities} ${lisp_maiden-commands} ${lisp_maiden-storage} ${lisp_postmodern}";
      name = "lisp_maiden-chatlog-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
