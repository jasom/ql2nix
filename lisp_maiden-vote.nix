
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_cl-ppcre, lisp_maiden-client-entities, lisp_maiden-commands,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_maiden-client-entities lisp_maiden-commands  ];
      inherit stdenv;
      systemName = "maiden-vote";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_maiden-client-entities} ${lisp_maiden-commands}";
      name = "lisp_maiden-vote-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
