
{ buildLispPackage, stdenv, fetchurl, lisp-project_circular-streams, 
   lisp_fast-io,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fast-io  ];
      inherit stdenv;
      systemName = "circular-streams";
      
      sourceProject = "${lisp-project_circular-streams}";
      patches = [];
      lisp_dependencies = "${lisp_fast-io}";
      name = "lisp_circular-streams-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
