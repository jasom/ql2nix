
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_lambda-fiddle, lisp_maiden, lisp_maiden-client-entities,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lambda-fiddle lisp_maiden lisp_maiden-client-entities  ];
      inherit stdenv;
      systemName = "maiden-commands";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_lambda-fiddle} ${lisp_maiden} ${lisp_maiden-client-entities}";
      name = "lisp_maiden-commands-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
