
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_cl-ppcre, lisp_maiden-client-entities, lisp_maiden-commands, lisp_maiden-storage,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_maiden-client-entities lisp_maiden-commands lisp_maiden-storage  ];
      inherit stdenv;
      systemName = "maiden-blocker";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_maiden-client-entities} ${lisp_maiden-commands} ${lisp_maiden-storage}";
      name = "lisp_maiden-blocker-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
