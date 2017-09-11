
{ buildLispPackage, stdenv, fetchurl, lisp-project_circular-streams, 
   lisp_circular-streams, lisp_cl-test-more, lisp_flexi-streams,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_circular-streams lisp_cl-test-more lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "circular-streams-test";
      
      sourceProject = "${lisp-project_circular-streams}";
      patches = [];
      lisp_dependencies = "${lisp_circular-streams} ${lisp_cl-test-more} ${lisp_flexi-streams}";
      name = "lisp_circular-streams-test-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
